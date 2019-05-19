package react.transition;

import react.ReactComponent;
import react.ReactType;

private typedef Props = {
	var children:ReactFragment;
	@:optional var component:ReactType;
	@:optional var appear:Bool;
	@:optional var enter:Bool;
	@:optional var exit:Bool;
	@:optional var childFactory:ReactElement->ReactFragment;
}

@:jsRequire('react-transition-group', 'TransitionGroup')
extern class TransitionGroup extends ReactComponentOfProps<Props> {}
