package react;

import react.ReactComponent.ReactFragment;
import react.ReactComponent.ReactSingleFragment;
import tink.core.Noise;

typedef BaseProps<TChildren> = {
	var children:TChildren;
}

typedef BasePropsOpt<TChildren> = {
	@:optional var children:TChildren;
}

typedef BasePropsWithChildren = BaseProps<ReactFragment>;
typedef BasePropsWithChild = BaseProps<ReactSingleFragment>;

typedef BasePropsWithoutChildren = BasePropsOpt<Noise>;

typedef BasePropsWithOptChildren = BasePropsOpt<ReactFragment>;
typedef BasePropsWithOptChild = BasePropsOpt<ReactSingleFragment>;
