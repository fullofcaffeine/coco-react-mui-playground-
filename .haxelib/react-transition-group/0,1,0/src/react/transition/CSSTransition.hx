package react.transition;

import react.ReactComponent;
import react.transition.Transition.TransitionProps;

@:coreType
private abstract ClassNames from String from CSSTransitionClassNames {}

typedef CSSTransitionClassNames = {
	@:optional var appear:String;
	@:optional var appearActive:String;
	@:optional var enter:String;
	@:optional var enterActive:String;
	@:optional var enterDone:String;
	@:optional var exit:String;
	@:optional var exitActive:String;
	@:optional var exitDone:String;
}

typedef CSSTransitionProps<TChildProps> = {
	> TransitionProps<TChildProps>,

	@:optional var classNames:ClassNames;
}

@:acceptsMoreProps('react.transition.Transition')
@:jsRequire('react-transition-group', 'CSSTransition')
extern class CSSTransition<TChildProps>
extends ReactComponentOfProps<CSSTransitionProps<TChildProps>> {}
