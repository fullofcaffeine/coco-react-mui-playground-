package react.macro;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.TypeTools;

import react.macro.MacroUtil.*;

@:dce
class PureComponentMacro
{
	static public inline var PURE_COMPONENT_BUILDER = 'PureComponent';
	@:deprecated static public inline var PURE_META = ReactMeta.PureComponent;

	static public function buildComponent(inClass:ClassType, fields:Array<Field>):Array<Field>
	{
		if (inClass.meta.has(ReactMeta.PureComponentInjected)) return fields;
		if (!inClass.meta.has(ReactMeta.PureComponent)) return fields;

		if (getField(fields, 'shouldComponentUpdate') == null) {
			var propsType:Type = TDynamic(null);
			var stateType:Type = TDynamic(null);

			switch (inClass.superClass)
			{
				case {params: params, t: _.toString() => cls}
				if (cls == 'react.ReactComponentOf' || cls == 'react.PureComponentOf'):
					propsType = params[0];
					stateType = params[1];

				default:
			}

			var propsCT:ComplexType = TypeTools.toComplexType(propsType);
			var stateCT:ComplexType = TypeTools.toComplexType(stateType);

			var hasProps = !isEmpty(propsCT);
			var hasState = !isEmpty(stateCT);

			var shouldUpdateExpr:Expr = null;

			if (hasProps && hasState)
				shouldUpdateExpr = exprShouldUpdatePropsAndState();
			else if (hasProps)
				shouldUpdateExpr = exprShouldUpdateProps();
			else if (hasState)
				shouldUpdateExpr = exprShouldUpdateState();
			else
				shouldUpdateExpr = exprShouldNeverUpdate();

			addShouldUpdate(fields, propsCT, stateCT, shouldUpdateExpr);
		}

		return fields;
	}

	static function addShouldUpdate(
		fields:Array<Field>,
		propsType:ComplexType,
		stateType:ComplexType,
		shouldUpdateExpr:Expr
	) {
		var args:Array<FunctionArg> = [
			{name: 'nextProps', type: propsType, opt: false, value: null},
			{name: 'nextState', type: stateType, opt: false, value: null}
		];

		var fun = {
			args: args,
			ret: macro :Bool,
			expr: shouldUpdateExpr
		};

		fields.push({
			name: 'shouldComponentUpdate',
			access: [APublic, AOverride],
			kind: FFun(fun),
			pos: Context.currentPos()
		});
	}

	static function exprShouldNeverUpdate()
	{
		return macro {
			return false;
		};
	}

	static function exprShouldUpdateProps()
	{
		return macro {
			return !react.ReactUtil.shallowCompare(props, nextProps);
		};
	}

	static function exprShouldUpdateState()
	{
		return macro {
			return !react.ReactUtil.shallowCompare(state, nextState);
		};
	}

	static function exprShouldUpdatePropsAndState()
	{
		return macro {
			return !react.ReactUtil.shallowCompare(state, nextState)
				|| !react.ReactUtil.shallowCompare(props, nextProps);
		};
	}
}

