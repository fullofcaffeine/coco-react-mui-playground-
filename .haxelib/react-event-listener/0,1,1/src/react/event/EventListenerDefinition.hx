package react.event;

import react.types.DOMAttributes;

typedef EventOptions = {
	var capture:Bool;
	var passive:Bool;
}

typedef EventListenerDefinition<T> = {
	var handler:HandlerOrVoid<T>;
	var options:EventOptions;
}

@:coreType
abstract EventListenerHandler
from EventListenerDefinition<Any>
from HandlerOrVoid<ClassicHandler> {}
