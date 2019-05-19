package tink.lang.sugar;

import haxe.macro.Expr;
import haxe.ds.Option;
using tink.MacroApi;

class ShortLambdas {
  
  static public function protectArrows(e:Expr)
    return
      switch e {
        case macro [$a{args}] if (args.length > 0 && switch args[0] { case macro $k => $v: true; default: false; }):
          [for (a in args)
            switch a {
              case macro $k => $v:
                macro @:pos(a.pos) ($k) => $v;
              default: a;
            }
          ].toArray();
        case { expr: ESwitch(_, cases, _)}:
          for (c in cases) 
            c.values = c.values.map(function (v) return v.transform(function (e) return switch e {
              case macro $a => $b:
                macro @:pos(e.pos) ($a) => $b;
              default: e;
            }));
          e;
        default: e;
      }
  
  static function parseArg(arg:Expr) 
    return
      switch arg {
        case macro _: Success(None);
        case macro []: 
          arg.reject('At least one expression needed');
        case macro [$a{args}] if (Lambda.foreach(args, Exprs.isWildcard)):
          Success(Some(args.length));
        default: 
          arg.pos.makeFailure('Unsuitable switch argument');
      }
  
  static function returnIfNotVoid(old:Expr)
    return
      if (old.typeof().sure().getID() == 'Void') old;
      else
        old.yield(function (e) return macro @:pos(old.pos) return $e, { leaveLoops : true });
        
  static function arrow(args, body:Expr, pos:Position) 
    return body.func(args, true).asExpr(pos);
    // return body.bounceExpr(returnIfNotVoid).func(args, false).asExpr();
  
  static function getIdents(exprs:Array<Expr>)
    return [
      for (e in exprs)
        switch e {
          case macro ($i{arg}:$ct): arg.toArg(ct);
          case _: e.getIdent().sure().toArg();
        }
    ];
  
  static function parseSwitch(arg, cases, edef, e:Expr, isFunction):Expr
    return
      switch parseArg(arg) {
        case Success(o):
          var tuple = false;
          var count = 1;
          switch o {
            case Some(c):
              tuple = true;
              count = c;
            default:
          }
          var tmps = [for (i in 0...count) MacroApi.tempName().resolve()];
          var body = ESwitch(tuple ? tmps.toArray() : tmps[0], cases, edef).at(e.pos);
          process(
            if (isFunction)
              macro @:pos(e.pos) @f($a{tmps}) $body
            else
              macro @:pos(e.pos) @do($a{tmps}) $body
          );
        default: e;
      }
  
      
  static public function matchers(e:Expr)
    return
      switch e {
        case { expr:ESwitch(arg, cases, edef) }:  
          parseSwitch(arg, cases, edef, e, true);
        case macro @do ${{ expr:ESwitch(arg, cases, edef) }}:  
          parseSwitch(arg, cases, edef, e, false);
        case macro @f ${{ expr:ESwitch(arg, cases, edef) }}:  
          parseSwitch(arg, cases, edef, e, true);
        default: e;
      }
      
  static public function process(e:Expr) 
    return
      switch e {
        case macro [$a{args}] => $body:
          arrow(getIdents(args), body, e.pos);
        case macro $i{arg} => $body:
          arrow([arg.toArg()], body, e.pos);
        case macro ($i{arg}:$ct) => $body:
          arrow([arg.toArg(ct)], body, e.pos);
        case macro @do($a{args}) $body:
          body.func(getIdents(args), false).asExpr(e.pos);
        case macro @f($a{args}) $body:
          body.func(getIdents(args), true).asExpr(e.pos);
        default: e;
      }
}
