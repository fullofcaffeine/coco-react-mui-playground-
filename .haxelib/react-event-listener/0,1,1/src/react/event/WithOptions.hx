package react.event;

import react.types.DOMAttributes;

typedef PartialEventOptions = {
	@:optional var capture:Bool;
	@:optional var passive:Bool;
}

@:jsRequire('react-event-listener', 'withOptions')
extern class WithOptions {
	@:selfCall
	public static function withOptions<T>(
		handler:HandlerOrVoid<T>,
		options:PartialEventOptions
	):EventListenerDefinition<T>;
}
