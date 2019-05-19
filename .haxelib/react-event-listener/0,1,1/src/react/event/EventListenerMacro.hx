package react.event;

import haxe.macro.Expr;
import react.macro.PropsValidator;

class EventListenerMacro {
	public static inline var PROPS_VALIDATOR_KEY = 'react.event.EventListener';

	public static function registerValidator() {
		PropsValidator.register(PROPS_VALIDATOR_KEY, validator);
	}

	public static function validator(name:String, expr:Expr):Null<Expr> {
		if (StringTools.startsWith(name, 'on')) {
			return macro @:pos(expr.pos) (${expr}:react.event.EventListenerDefinition.EventListenerHandler);
		}

		return null;
	}
}
