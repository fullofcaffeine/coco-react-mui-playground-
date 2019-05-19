package react.types.macro;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.TypeTools;

class ForcedOverrideMacro {
	public static function build():ComplexType {
		return switch (Context.getLocalType()) {
			case TInst(_, [t1, t2]):
				var fields = extractFields(t1);
				var newFields = extractFields(t2);

				for (f in newFields.keys()) fields.set(f, newFields.get(f));

				return TAnonymous(Lambda.array(fields));

			default:
				Context.error(
					'ForcedOverride expects two type parameters',
					Context.currentPos()
				);
		};
	}

	static function extractFields(t:Type):Map<String, Field> {
		return switch(TypeTools.toComplexType(Context.follow(t))) {
			case TAnonymous(fields):
				[for (f in fields) f.name => f];

			default:
				Context.error(
					'ForcedOverride: structure expected',
					Context.currentPos()
				);
		};
	}
}
