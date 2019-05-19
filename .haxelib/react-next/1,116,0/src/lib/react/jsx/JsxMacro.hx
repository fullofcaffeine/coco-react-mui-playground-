package react.jsx;

import haxe.macro.Expr;
import haxe.macro.ExprTools;
import haxe.macro.Type;

@:dce
class JsxMacro
{
	static public function handleMarkup(inClass:ClassType, fields:Array<Field>):Array<Field>
	{
		if (inClass.isExtern) return fields;

		for (f in fields)
			if (StringTools.startsWith(f.name, 'render'))
				wrapMarkupInField(f);

		return fields;
	}

	static public function wrapMarkupInField(f:Field)
	{
		switch (f.kind) {
			case FFun({expr: e, ret: ret, params: params, args: args}):
				function wrap(e:Expr) {
					return switch(e.expr) {
						// Replace markup by a jsx call
						case EMeta({name: ':markup'}, e):
							macro @:pos(e.pos) react.ReactMacro.jsx(@:markup $e);

						// Do not iterate inside function calls to avoid jsx calls of all sorts
						case ECall(ecall, params): e;

						// Iterate recursively
						default: ExprTools.map(e, wrap);
					}
				}

				f.kind = FFun({
					expr: ExprTools.map(e, wrap),
					ret: ret,
					params: params,
					args: args
				});

			default:
		}
	}
}
