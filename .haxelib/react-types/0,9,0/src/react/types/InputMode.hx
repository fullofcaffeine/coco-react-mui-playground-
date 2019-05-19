package react.types;

@:enum abstract InputMode(String) to String {
	/**
		No virtual keyboard; this is useful when the application or site
		implements its own keyboard input control.
	*/
	var None = "none";

	/**
		Standard text input keyboard for the user's current locale.
	*/
	var Text = "text";

	/**
		Fractional numeric input keyboard containing the digits and the
		appropriate separator character for the user's locale (typically either
		"." or ",").
	*/
	var Decimal = "decimal";

	/**
		Numeric input keyboard; all that is needed are the digits 0 through 9.
	*/
	var Numeric = "numeric";

	/**
		A telephone keypad input, including the digits 0 through 9, the asterisk
		("*"), and the pound ("#") key. Form inputs that require a telephone
		keypad should typically use <input type="tel"> instead.
	*/
	var Tel = "tel";

	/**
		A virtual keyboard optimized for search input. For instance, the return
		key may be re-labeled "Search", and there may be other optimizations.
	*/
	var Search = "search";

	/**
		A virtual keyboard optimized for entering email addresses; typically
		this includes the "@" character as well as other optimizations. Form
		inputs that require email address entry should typically use
		<input type="email"> instead.
	*/
	var Email = "email";

	/**
		A keypad optimized for entering URLs. This may have the "/" key more
		prominently available, for example. Enhanced features could include
		history access and the like as w"*")
	*/
	var url = "url";
}
