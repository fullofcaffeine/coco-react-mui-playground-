package react.event;

import js.html.EventTarget;
import react.ReactComponent;
import react.types.DOMAttributes;

@:coreType
abstract EventListenerTarget from String from EventTarget {}

typedef EventListenerProps = {
	var target:EventListenerTarget;
	@:optional var children:ReactFragment;
}

@:acceptsMoreProps('react.event.EventListener')
@:jsRequire('react-event-listener', 'default')
extern class EventListener extends ReactComponentOfProps<EventListenerProps> {}
