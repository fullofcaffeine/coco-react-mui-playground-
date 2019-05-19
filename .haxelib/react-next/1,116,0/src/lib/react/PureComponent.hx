package react;

import react.ReactComponent;

typedef PureComponent = PureComponentOf<Dynamic, Dynamic>;
typedef PureComponentOfProps<TProps:{}> = PureComponentOf<TProps, Empty>;
typedef PureComponentOfState<TState:{}> = PureComponentOf<Empty, TState>;

#if (!react_global)
@:jsRequire("react", "PureComponent")
#end
@:native('React.PureComponent')
@:keepSub
extern class PureComponentOf<TProps:{}, TState:{}>
extends ReactComponentOf<TProps, TState>
{}
