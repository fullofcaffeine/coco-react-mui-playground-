package react.transition;

import js.html.HtmlElement;
import react.ReactComponent;
import react.types.CallbackOrVoid;
import react.types.HandlerOrVoid;

@:coreType
abstract TransitionChildren<TChildProps>
from ReactSingleFragment
from TransitionStatus->TChildProps->ReactFragment {}

@:coreType
abstract TransitionTimeout from Int from TransitionTimeoutDef {}

@:enum abstract TransitionStatus(String) to String {
	var Entering = "entering";
	var Entered = "entered";
	var Exiting = "exiting";
	var Exited = "exited";
	var Unmounted = "unmounted";
}

typedef TransitionTimeoutDef = {
	@:optional var enter:Int;
	@:optional var exit:Int;
}

typedef TransitionProps<TChildProps> = {
	@:optional var children:TransitionChildren<TChildProps>;
	// @:optional var in:Bool; // Reserved keyword, parsed by props validator
	@:optional var mountOnEnter:Bool;
	@:optional var unmountOnExit:Bool;
	@:optional var appear:Bool;
	@:optional var enter:Bool;
	@:optional var exit:Bool;
	@:optional var timeout:TransitionTimeout;
	@:optional var addEndListener:HtmlElement->HandlerOrVoid<ClassicHandler>->Void;
	@:optional var onEnter:CallbackOrVoid<HtmlElement->Bool->Void>;
	@:optional var onEntering:CallbackOrVoid<HtmlElement->Bool->Void>;
	@:optional var onEntered:CallbackOrVoid<HtmlElement->Bool->Void>;
	@:optional var onExit:CallbackOrVoid<HtmlElement->Void>;
	@:optional var onExiting:CallbackOrVoid<HtmlElement->Void>;
	@:optional var onExited:CallbackOrVoid<HtmlElement->Void>;
}

@:acceptsMoreProps('react.transition.Transition')
@:jsRequire('react-transition-group', 'Transition')
extern class Transition<TChildProps>
extends ReactComponentOfProps<TransitionProps<TChildProps>> {}
