package react;

import js.Symbol;
import react.ReactComponent.ReactElement;
import react.ReactComponent.ReactFragment;
import react.ReactComponent.ReactSingleFragment;
import react.ReactContext;
import react.ReactType;

/**
	https://facebook.github.io/react/docs/react-api.html
**/
#if (!react_global)
@:jsRequire("react")
#end
@:native('React')
extern class React
{
	// Warning: react.React.PropTypes is deprecated, reference as react.ReactPropTypes

	/**
		https://reactjs.org/docs/react-api.html#createelement
	**/
	public static function createElement(type:ReactType, ?attrs:Dynamic, children:haxe.extern.Rest<Dynamic>):ReactElement;

	/**
		https://reactjs.org/docs/react-api.html#cloneelement
	**/
	public static function cloneElement(element:ReactElement, ?attrs:Dynamic, children:haxe.extern.Rest<Dynamic>):ReactElement;

	/**
		https://reactjs.org/docs/react-api.html#isvalidelement
	**/
	public static function isValidElement(object:ReactFragment):Bool;

	/**
		https://reactjs.org/docs/context.html#reactcreatecontext

		Creates a `{ Provider, Consumer }` pair.
		When React renders a context `Consumer`, it will read the current
		context value from the closest matching `Provider` above it in the tree.

		The `defaultValue` argument is **only** used by a `Consumer` when it
		does not have a matching Provider above it in the tree. This can be
		helpful for testing components in isolation without wrapping them.

		Note: passing `undefined` as a `Provider` value does not cause Consumers
		to use `defaultValue`.
	**/
	public static function createContext<TContext>(
		?defaultValue:TContext,
		?calculateChangedBits:TContext->TContext->Int
	):{
		Provider:ReactProviderType<TContext>,
		Consumer:ReactContext<TContext>
	};

	/**
		https://reactjs.org/docs/react-api.html#reactcreateref

		Note: this API has been introduced in React 16.3
		If you are using an earlier release of React, use callback refs instead
		https://reactjs.org/docs/refs-and-the-dom.html#callback-refs
	**/
	public static function createRef<TRef>():ReactRef<TRef>;

	/**
		https://reactjs.org/docs/react-api.html#reactforwardref
		See also https://reactjs.org/docs/forwarding-refs.html

		Note: this API has been introduced in React 16.3
		If you are using an earlier release of React, use callback refs instead
		https://reactjs.org/docs/refs-and-the-dom.html#callback-refs
	**/
	public static function forwardRef<TProps, TRef>(render:TProps->ReactRef<TRef>->ReactFragment):ReactType;

	/**
		https://reactjs.org/docs/react-api.html#reactchildren
	**/
	public static var Children:ReactChildren;

	public static var version:String;

	public static var Fragment:Symbol;
	public static var StrictMode:Symbol;
	public static var unstable_AsyncMode:Symbol;
	public static var unstable_Profiler:Symbol;

	@:native('__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED')
	public static var _internals:ReactSharedInternals;
}

/**
	https://reactjs.org/docs/react-api.html#reactchildren
**/
extern interface ReactChildren
{
	/**
		https://reactjs.org/docs/react-api.html#reactchildrenmap
	**/
	function map(children:Dynamic, fn:ReactFragment->ReactFragment):Null<Array<ReactFragment>>;

	/**
		https://reactjs.org/docs/react-api.html#reactchildrenforeach
	**/
	function foreach(children:Dynamic, fn:ReactFragment->Void):Void;

	/**
		https://reactjs.org/docs/react-api.html#reactchildrencount
	**/
	function count(children:ReactFragment):Int;

	/**
		https://reactjs.org/docs/react-api.html#reactchildrenonly
	**/
	function only(children:ReactFragment):ReactSingleFragment;

	/**
		https://reactjs.org/docs/react-api.html#reactchildrentoarray
	**/
	function toArray(children:ReactFragment):Array<ReactFragment>;
}

@:deprecated
typedef CreateElementType = ReactType;

