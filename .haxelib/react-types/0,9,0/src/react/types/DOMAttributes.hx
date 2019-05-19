package react.types;

import js.html.Element;
import js.html.HtmlElement;

import css.Properties;
import react.types.EventHandler;

typedef StandardDOMAttributes = DOMAttributes<HtmlElement>;

typedef DOMAttributes<T:Element> = {
	> DOMEvents<T>,

	// React specific (or renamed) props
	@:optional var className:String;
	@:optional var dangerouslySetInnerHTML:{__html:String};
	@:optional var htmlFor:String;

	// Global attributes
	// https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes
	@:optional var accessKey:String;
	@:optional var contenteditable:Bool;
	@:optional var contextmenu:String;
	@:optional var dir:DirAttribute;
	@:optional var draggable:Bool;
	@:optional var hidden:Bool;
	@:optional var id:String;
	@:optional var inputmode:InputMode;
	@:optional var is:String;
	@:optional var lang:String;
	@:optional var slot:String;
	@:optional var spellcheck:Bool;
	@:optional var style:Properties;
	@:optional var tabIndex:Int;
	@:optional var title:String;

	// Other commonly used html attributes
	@:optional var href:String;
	// TODO
}

typedef DOMEvents<T:Element> = {
	// Clipboard Events
	@:optional var onCopy:HandlerOrVoid<ClipboardEventHandler<T>>;
	@:optional var onCopyCapture:HandlerOrVoid<ClipboardEventHandler<T>>;
	@:optional var onCut:HandlerOrVoid<ClipboardEventHandler<T>>;
	@:optional var onCutCapture:HandlerOrVoid<ClipboardEventHandler<T>>;
	@:optional var onPaste:HandlerOrVoid<ClipboardEventHandler<T>>;
	@:optional var onPasteCapture:HandlerOrVoid<ClipboardEventHandler<T>>;

	// Composition Events
	@:optional var onCompositionEnd:HandlerOrVoid<CompositionEventHandler<T>>;
	@:optional var onCompositionEndCapture:HandlerOrVoid<CompositionEventHandler<T>>;
	@:optional var onCompositionStart:HandlerOrVoid<CompositionEventHandler<T>>;
	@:optional var onCompositionStartCapture:HandlerOrVoid<CompositionEventHandler<T>>;
	@:optional var onCompositionUpdate:HandlerOrVoid<CompositionEventHandler<T>>;
	@:optional var onCompositionUpdateCapture:HandlerOrVoid<CompositionEventHandler<T>>;

	// Focus Events
	@:optional var onFocus:HandlerOrVoid<FocusEventHandler<T>>;
	@:optional var onFocusCapture:HandlerOrVoid<FocusEventHandler<T>>;
	@:optional var onBlur:HandlerOrVoid<FocusEventHandler<T>>;
	@:optional var onBlurCapture:HandlerOrVoid<FocusEventHandler<T>>;

	// Form Events
	@:optional var onChange:HandlerOrVoid<FormEventHandler<T>>;
	@:optional var onChangeCapture:HandlerOrVoid<FormEventHandler<T>>;
	@:optional var onInput:HandlerOrVoid<FormEventHandler<T>>;
	@:optional var onInputCapture:HandlerOrVoid<FormEventHandler<T>>;
	@:optional var onReset:HandlerOrVoid<FormEventHandler<T>>;
	@:optional var onResetCapture:HandlerOrVoid<FormEventHandler<T>>;
	@:optional var onSubmit:HandlerOrVoid<FormEventHandler<T>>;
	@:optional var onSubmitCapture:HandlerOrVoid<FormEventHandler<T>>;
	@:optional var onInvalid:HandlerOrVoid<FormEventHandler<T>>;
	@:optional var onInvalidCapture:HandlerOrVoid<FormEventHandler<T>>;

	// Image Events
	@:optional var onLoad:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onLoadCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onError:HandlerOrVoid<ReactEventHandler<T>>; // also a Media Event
	@:optional var onErrorCapture:HandlerOrVoid<ReactEventHandler<T>>; // also a Media Event
	// Keyboard Events
	@:optional var onKeyDown:HandlerOrVoid<KeyboardEventHandler<T>>;
	@:optional var onKeyDownCapture:HandlerOrVoid<KeyboardEventHandler<T>>;
	@:optional var onKeyPress:HandlerOrVoid<KeyboardEventHandler<T>>;
	@:optional var onKeyPressCapture:HandlerOrVoid<KeyboardEventHandler<T>>;
	@:optional var onKeyUp:HandlerOrVoid<KeyboardEventHandler<T>>;
	@:optional var onKeyUpCapture:HandlerOrVoid<KeyboardEventHandler<T>>;

	// Media Events
	@:optional var onAbort:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onAbortCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onCanPlay:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onCanPlayCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onCanPlayThrough:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onCanPlayThroughCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onDurationChange:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onDurationChangeCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onEmptied:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onEmptiedCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onEncrypted:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onEncryptedCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onEnded:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onEndedCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onLoadedData:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onLoadedDataCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onLoadedMetadata:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onLoadedMetadataCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onLoadStart:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onLoadStartCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onPause:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onPauseCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onPlay:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onPlayCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onPlaying:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onPlayingCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onProgress:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onProgressCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onRateChange:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onRateChangeCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onSeeked:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onSeekedCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onSeeking:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onSeekingCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onStalled:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onStalledCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onSuspend:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onSuspendCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onTimeUpdate:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onTimeUpdateCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onVolumeChange:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onVolumeChangeCapture:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onWaiting:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onWaitingCapture:HandlerOrVoid<ReactEventHandler<T>>;

	// MouseEvents
	@:optional var onClick:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onClickCapture:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onContextMenu:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onContextMenuCapture:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onDoubleClick:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onDoubleClickCapture:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onDrag:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDragCapture:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDragEnd:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDragEndCapture:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDragEnter:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDragEnterCapture:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDragExit:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDragExitCapture:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDragLeave:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDragLeaveCapture:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDragOver:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDragOverCapture:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDragStart:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDragStartCapture:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDrop:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onDropCapture:HandlerOrVoid<DragEventHandler<T>>;
	@:optional var onMouseDown:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onMouseDownCapture:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onMouseEnter:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onMouseLeave:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onMouseMove:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onMouseMoveCapture:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onMouseOut:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onMouseOutCapture:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onMouseOver:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onMouseOverCapture:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onMouseUp:HandlerOrVoid<MouseEventHandler<T>>;
	@:optional var onMouseUpCapture:HandlerOrVoid<MouseEventHandler<T>>;

	// Selection Events
	@:optional var onSelect:HandlerOrVoid<ReactEventHandler<T>>;
	@:optional var onSelectCapture:HandlerOrVoid<ReactEventHandler<T>>;

	// Touch Events
	@:optional var onTouchCancel:HandlerOrVoid<TouchEventHandler<T>>;
	@:optional var onTouchCancelCapture:HandlerOrVoid<TouchEventHandler<T>>;
	@:optional var onTouchEnd:HandlerOrVoid<TouchEventHandler<T>>;
	@:optional var onTouchEndCapture:HandlerOrVoid<TouchEventHandler<T>>;
	@:optional var onTouchMove:HandlerOrVoid<TouchEventHandler<T>>;
	@:optional var onTouchMoveCapture:HandlerOrVoid<TouchEventHandler<T>>;
	@:optional var onTouchStart:HandlerOrVoid<TouchEventHandler<T>>;
	@:optional var onTouchStartCapture:HandlerOrVoid<TouchEventHandler<T>>;

	// Pointer Events
	@:optional var onPointerDown:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerDownCapture:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerMove:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerMoveCapture:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerUp:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerUpCapture:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerCancel:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerCancelCapture:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerEnter:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerEnterCapture:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerLeave:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerLeaveCapture:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerOver:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerOverCapture:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerOut:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onPointerOutCapture:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onGotPointerCapture:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onGotPointerCaptureCapture:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onLostPointerCapture:HandlerOrVoid<PointerEventHandler<T>>;
	@:optional var onLostPointerCaptureCapture:HandlerOrVoid<PointerEventHandler<T>>;

	// UI Events
	@:optional var onScroll:HandlerOrVoid<UIEventHandler<T>>;
	@:optional var onScrollCapture:HandlerOrVoid<UIEventHandler<T>>;

	// Wheel Events
	@:optional var onWheel:HandlerOrVoid<WheelEventHandler<T>>;
	@:optional var onWheelCapture:HandlerOrVoid<WheelEventHandler<T>>;

	// Animation Events
	@:optional var onAnimationStart:HandlerOrVoid<AnimationEventHandler<T>>;
	@:optional var onAnimationStartCapture:HandlerOrVoid<AnimationEventHandler<T>>;
	@:optional var onAnimationEnd:HandlerOrVoid<AnimationEventHandler<T>>;
	@:optional var onAnimationEndCapture:HandlerOrVoid<AnimationEventHandler<T>>;
	@:optional var onAnimationIteration:HandlerOrVoid<AnimationEventHandler<T>>;
	@:optional var onAnimationIterationCapture:HandlerOrVoid<AnimationEventHandler<T>>;

	// Transition Events
	@:optional var onTransitionEnd:HandlerOrVoid<TransitionEventHandler<T>>;
	@:optional var onTransitionEndCapture:HandlerOrVoid<TransitionEventHandler<T>>;
}

