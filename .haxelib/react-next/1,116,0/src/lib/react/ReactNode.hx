package react;

import react.ReactType;

#if !react_ignore_reactnode_deprecation @:deprecated #end
typedef ReactNode = ReactType;

#if !react_ignore_reactnode_deprecation @:deprecated #end
typedef ReactNodeOf<T> = ReactTypeOf<T>;
