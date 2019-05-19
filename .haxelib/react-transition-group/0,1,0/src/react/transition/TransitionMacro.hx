package react.transition;

import haxe.macro.Expr;
import react.macro.PropsValidator;

class TransitionMacro {
	public static inline var TRANSITION_PROPS_VALIDATOR_KEY = 'react.transition.Transition';

	public static function registerValidator() {
		PropsValidator.register(TRANSITION_PROPS_VALIDATOR_KEY, validator);
	}

	public static function validator(name:String, expr:Expr):Null<Expr> {
		// Props that are reserved keywords in Haxe
		if (name == 'in') return macro @:pos(expr.pos) (${expr}:Bool);

		// Accept all other props (will be passed as ChildProps)
		return expr;
	}
}

