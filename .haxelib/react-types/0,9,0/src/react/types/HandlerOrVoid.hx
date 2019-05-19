package react.types;

import js.html.Event;

typedef ClassicHandler = Event->Void;

@:coreType
abstract HandlerOrVoid<Handler> from Handler from Noop from ClassicHandler {}
