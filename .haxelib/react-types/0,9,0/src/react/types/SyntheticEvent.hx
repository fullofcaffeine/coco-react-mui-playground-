package react.types;

import js.html.DataTransfer;
import js.html.Document;
import js.html.Event;
import js.html.EventTarget;
import js.html.Element;
import js.html.AnimationEvent as NativeAnimationEvent;
import js.html.ClipboardEvent as NativeClipboardEvent;
import js.html.CompositionEvent as NativeCompositionEvent;
import js.html.DragEvent as NativeDragEvent;
import js.html.FocusEvent as NativeFocusEvent;
import js.html.KeyboardEvent as NativeKeyboardEvent;
import js.html.MouseEvent as NativeMouseEvent;
import js.html.PointerEvent as NativePointerEvent;
import js.html.TouchEvent as NativeTouchEvent;
import js.html.TransitionEvent as NativeTransitionEvent;
import js.html.UIEvent as NativeUIEvent;
import js.html.WheelEvent as NativeWheelEvent;

typedef BaseSyntheticEvent<TElement:Element> = {
	var bubbles:Bool;
	// var currentTarget:EventTarget & TElement;
	var currentTarget:TElement;
	var cancelable:Bool;
	var defaultPrevented:Bool;
	var eventPhase:Int;
	var isTrusted:Bool;
	var preventDefault:Void->Void;
	var isDefaultPrevented:Void->Bool;
	var stopPropagation:Void->Void;
	var isPropagationStopped:Void->Bool;
	var persist:Void->Void;
	var timeStamp:Float;
	var type:String;
}

typedef SyntheticEvent<TElement:Element> = {
	> BaseSyntheticEvent<TElement>,
	var nativeEvent:Event;
	var target:EventTarget;
}

typedef ClipboardEvent<TElement:Element> = {
	> BaseSyntheticEvent<TElement>,
	var clipboardData:DataTransfer;
	var nativeEvent:NativeClipboardEvent;
}

typedef CompositionEvent<TElement:Element> = {
	> BaseSyntheticEvent<TElement>,
	var data:String;
	var nativeEvent:NativeCompositionEvent;
}

typedef DragEvent<TElement:Element> = {
	> BaseMouseEvent<TElement>,
	var dataTransfer:DataTransfer;
	var nativeEvent:NativeDragEvent;
}

@:enum abstract PointerType(String) to String {
	var Mouse = 'mouse';
	var Pen = 'pen';
	var Touch = 'touch';
}

typedef PointerEvent<TElement:Element> = {
	> BaseMouseEvent<TElement>,
	var pointerId:Int;
	var pressure:Float;
	var tiltX:Float;
	var tiltY:Float;
	var width:Float;
	var height:Float;
	var pointerType:PointerType;
	var isPrimary:Bool;
	var nativeEvent:NativePointerEvent;
}

typedef FocusEvent<TElement:Element> = {
	> BaseSyntheticEvent<TElement>,
	var nativeEvent:NativeFocusEvent;
	var relatedTarget:EventTarget;
	// var target:EventTarget & TElement;
	var target:TElement;
}

typedef FormEvent<TElement:Element> = {
	> BaseSyntheticEvent<TElement>,
}

typedef InvalidEvent<TElement:Element> = {
	> BaseSyntheticEvent<TElement>,
	// var target:EventTarget & TElement;
	var target:TElement;
}

typedef ChangeEvent<TElement:Element> = {
	> BaseSyntheticEvent<TElement>,
	// var target:EventTarget & TElement;
	var target:TElement;
}

typedef KeyboardEvent<TElement:Element> = {
	> BaseSyntheticEvent<TElement>,
	var altKey:Bool;
	var charCode:Int;
	var ctrlKey:Bool;
	var getModifierState:String->Bool;
	var key:String;
	var keyCode:Int;
	var locale:String;
	var location:Float;
	var metaKey:Bool;
	var nativeEvent:NativeKeyboardEvent;
	var repeat:Bool;
	var shiftKey:Bool;
	var which:Int;
}

typedef BaseMouseEvent<TElement:Element> = {
	> BaseSyntheticEvent<TElement>,
	var altKey:Bool;
	var button:Int;
	var buttons:Int;
	var clientX:Float;
	var clientY:Float;
	var ctrlKey:Bool;
	var getModifierState:String->Bool;
	var metaKey:Bool;
	var pageX:Float;
	var pageY:Float;
	var relatedTarget:EventTarget;
	var screenX:Float;
	var screenY:Float;
	var shiftKey:Bool;
}

typedef MouseEvent<TElement:Element> = {
	> BaseMouseEvent<TElement>,
	var nativeEvent:NativeMouseEvent;
}

typedef Touch = {
	var identifier:Int;
	var target:EventTarget;
	var screenX:Float;
	var screenY:Float;
	var clientX:Float;
	var clientY:Float;
	var pageX:Float;
	var pageY:Float;
}

extern interface TouchList extends ArrayAccess<Touch> {
	var length:Int;
	function item(index:Int):Touch;
	function identifiedTouch(identifier:Int):Touch;
}

typedef TouchEvent<TElement:Element> = {
	> BaseSyntheticEvent<TElement>,
	var altKey:Bool;
	var changedTouches:TouchList;
	var ctrlKey:Bool;
	var getModifierState:String->Bool;
	var metaKey:Bool;
	var nativeEvent:NativeTouchEvent;
	var shiftKey:Bool;
	var targetTouches:TouchList;
	var touches:TouchList;
}

typedef StyleMedia = {}

typedef AbstractView = {
	var styleMedia:StyleMedia;
	var document:Document;
}

typedef UIEvent<TElement:Element> = {
	> BaseSyntheticEvent<TElement>,
	var detail:Float;
	var nativeEvent:NativeUIEvent;
	var view:AbstractView;
}

typedef WheelEvent<TElement:Element> = {
	> BaseMouseEvent<TElement>,
	var deltaMode:Int;
	var deltaX:Float;
	var deltaY:Float;
	var deltaZ:Float;
	var nativeEvent:NativeWheelEvent;
}

typedef AnimationEvent<TElement:Element> = {
	> BaseSyntheticEvent<TElement>,
	var animationName:String;
	var elapsedTime:Float;
	var nativeEvent:NativeAnimationEvent;
	var pseudoElement:String;
}

typedef TransitionEvent<TElement:Element> = {
	> BaseSyntheticEvent<TElement>,
	var elapsedTime:Float;
	var nativeEvent:NativeTransitionEvent;
	var propertyName:String;
	var pseudoElement:String;
}

