package coconut.data.macros;

#if macro
import haxe.macro.Type;
import haxe.macro.Expr;
import haxe.macro.Context;
using haxe.macro.Tools;
using tink.MacroApi;
#end

class Models {
  #if macro 

  static public function build() 
    return ModelBuilder.build();

  static function getInitialArgs()
    return 
      switch Context.getLocalType() {
        case TInst(_, [TInst(_.get() => cl, params)]):
          
          switch cl.constructor.get().type.applyTypeParameters(cl.params, params) {
            case TFun([arg], _): arg.t;
            default: throw 'assert';
          }

        default: throw 'assert';
      }    


  static function getObservables()
    return 
      switch Context.getLocalType() {
        case TInst(_, [_.toComplex() => ct]):

          (macro (null : $ct).observables).typeof().sure();

        default: throw 'assert';
      }    

  static function getPatch() 
    return 
      switch Context.getLocalType() {
        case TInst(_.get() => cl, [_.toComplex() => ct]):
          
          if (cl.isInterface)
            Context.currentPos().error('Cannot use Patch<T> on interfaces');

          (macro {
            var p = null;
            @:privateAccess (null : $ct).__cocoupdate(p);
            p;
          }).typeof().sure();

        default: throw 'assert';
      }

  static function considerValid(pack:Array<String>, name:String) 
    return
      switch pack.concat([name]).join('.') {
        case  'Date' | 'Int' | 'String' | 'Bool' | 'Float': true;
        case 'tink.pure.List': true;
        case 'tink.Url': true;
        default: 
          switch [pack, name] {
            case [['tink', 'core'], 'NamedWith' | 'Pair' | 'Lazy' | 'TypedError' | 'Future' | 'Promise']: true;
            default: false;
          };
      }
  
  static function checkMany(params:Array<Type>) 
    return [for (p in params) for (s in check(p)) s];

  static public function check(t:Type):Array<String>
    return 
      switch t.reduce() {
        case TAnonymous(_.get().fields => fields):
          var ret = [];
          for (f in fields)
            switch f.kind {
              case FVar(_, AccNever) | FMethod(_):
                for (s in check(f.type))
                  ret.push(s);
              default:
                ret.push('Field `${f.name}` of `${t.toString()}` needs to have write access `never`');
            }   

          ret;  
        case TFun(_, _): [];   
        case TAbstract(_.get() => a, _) if (!a.meta.has(':coreType') && check(a.type).length == 0): []; 
        case TAbstract(_.get().meta.has(':enum') => true, _): [];
        case TInst(_.get().kind => KTypeParameter(_), _): [];
        case TInst(_.get() => { pack: ['tink', 'state'], name: 'ObservableArray' | 'ObservableMap' }, params): checkMany(params);
        case TInst(_, params) | TAbstract(_, params) 
          if (
            Context.unify(t, Context.getType('tink.state.Observable.ObservableObject')) 
              || 
            Context.unify(t, Context.getType('coconut.data.Model'))
          ):
            checkMany(params);
        case TAbstract(_.get().meta => m, params)
           | TEnum(_.get().meta => m, params)
           | TInst(_.get().meta => m, params) if (m.has(':pure') || m.has(':observable')):

          checkMany(params);
        case TEnum(_.get() => e, params):
          var ret = [];
          for (c in e.constructs) 
            switch c.type.reduce() {
              case TFun(args, _):
                for (a in args)
                  for (s in check(a.t)) 
                    ret.push('Enum ${e.name} is not acceptable coconut data because $s for argument ${c.name}.${a.name}');
              default:
            }

          if (ret.length == null)
            e.meta.add(':observable', [], e.pos);

          ret.concat(checkMany(params));

        case TAbstract(_.get() => { pack: pack, name: name }, params) 
           | TInst(_.get() => { pack: pack, name: name }, params) 
             if (considerValid(pack, name)):
          checkMany(params);
        case TDynamic(null): [];
        case v:
          [t.toString() + ' is not acceptable coconut data'];
      }
  #end
}
