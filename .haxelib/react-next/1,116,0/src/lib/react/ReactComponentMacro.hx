package react;

import react.macro.ReactComponentMacro as RealReactComponentMacro;
import react.macro.ReactComponentMacro.Builder;

@:dce
@:deprecated('ReactComponentMacro has moved to react.macro package')
class ReactComponentMacro {
	@:deprecated('ReactComponentMacro has moved to react.macro package')
	static public function appendBuilder(builder:Builder):Void
	{
		RealReactComponentMacro.appendBuilder(builder);
	}

	@:deprecated('ReactComponentMacro has moved to react.macro package')
	static public function prependBuilder(builder:Builder):Void
	{
		RealReactComponentMacro.prependBuilder(builder);
	}
}
