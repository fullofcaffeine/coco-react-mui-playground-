package react.types;

import js.html.Element;
import react.types.SyntheticEvent;

typedef EventHandler<TElement:Element, E:BaseSyntheticEvent<TElement>> = E->Void;
typedef ReactEventHandler<TElement:Element> = EventHandler<TElement, BaseSyntheticEvent<TElement>>;

typedef ClipboardEventHandler<TElement:Element> = EventHandler<TElement, ClipboardEvent<TElement>>;
typedef CompositionEventHandler<TElement:Element> = EventHandler<TElement, CompositionEvent<TElement>>;
typedef DragEventHandler<TElement:Element> = EventHandler<TElement, DragEvent<TElement>>;
typedef FocusEventHandler<TElement:Element> = EventHandler<TElement, FocusEvent<TElement>>;
typedef FormEventHandler<TElement:Element> = EventHandler<TElement, FormEvent<TElement>>;
typedef ChangeEventHandler<TElement:Element> = EventHandler<TElement, ChangeEvent<TElement>>;
typedef KeyboardEventHandler<TElement:Element> = EventHandler<TElement, KeyboardEvent<TElement>>;
typedef MouseEventHandler<TElement:Element> = EventHandler<TElement, MouseEvent<TElement>>;
typedef TouchEventHandler<TElement:Element> = EventHandler<TElement, TouchEvent<TElement>>;
typedef PointerEventHandler<TElement:Element> = EventHandler<TElement, PointerEvent<TElement>>;
typedef UIEventHandler<TElement:Element> = EventHandler<TElement, UIEvent<TElement>>;
typedef WheelEventHandler<TElement:Element> = EventHandler<TElement, WheelEvent<TElement>>;
typedef AnimationEventHandler<TElement:Element> = EventHandler<TElement, AnimationEvent<TElement>>;
typedef TransitionEventHandler<TElement:Element> = EventHandler<TElement, TransitionEvent<TElement>>;

