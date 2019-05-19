package react.types.macro;

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Type;

class RecordMacro {
	// Note: this will only be persistent in haxe 4 preview 5 and newer
	@:persistent static var recordCache:Map<String, Array<Field>> = new Map();

	public static function build():ComplexType {
		return buildRecord(
			Context.getLocalType(),
			macro :String,
			true
		);
	}

	// Note: only Record<T, String> is supported atm
	public static function buildRecord(
		abstractEnumType:Type,
		valueType:ComplexType,
		?asPartial:Bool = false
	):ComplexType {
		switch (abstractEnumType) {
			case TInst(_, [TAbstract(_.get() => t, params)]):
				var cacheKey = '${t.module}.${t.name}';
				if (recordCache.exists(cacheKey))
					return TAnonymous(recordCache.get(cacheKey));

				var classes = t.impl.get().statics.get();

				var meta = asPartial
					? [{name: ":optional", params: null, pos: Context.currentPos()}]
					: null;

				var fields:Array<Field> = classes.map(function(c):Field {
					if (c.expr() == null) return null;

					// TODO: check if it matches with valueType
					return switch (c.expr().expr) {
						case TCast({expr: TConst(TString(name))}, _):
							{
								kind: FVar(valueType, null),
								name: name,
								meta: meta == null ? null : meta.copy(),
								pos: Context.currentPos()
							};

						// TODO: support other types
						default: null;
					}
				}).filter(function(f) return f != null);

				recordCache.set(cacheKey, fields);
				return TAnonymous(fields);

			default:
				throw 'buildRecord() should be called with an abstract enum';
		};
	}
}
