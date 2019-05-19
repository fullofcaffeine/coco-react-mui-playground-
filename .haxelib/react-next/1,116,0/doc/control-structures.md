## Control structures

React next supports `tink_hxx` control structures. This doc comes directly from
`tink_hxx`'s README with minor adaptations for use with Haxe React.

HXX has support for a few control structures.  Their main reason for existence
is that implementing a reentrant parser with autocompletion support proved
rather problematic in Haxe 3.

### If

This is what conditionals look like:

```html
<if {weather == 'sunny'}>
  <Sun />
<elseif {weather == 'mostly sunny'}>
  <Sun />
  <Cloud />
<else if {weather == 'cloudy'}>
  <Cloud />
  <Cloud />
  <Cloud />
<else>
  <Rain />
</if>
```

Note that `else` (as well as `elseif`) is optional and that both `elseif` and
`else if` will work.

### Switch

Switch statements are also supported, including guards but without `default`
branches (just use a catch-all `case` instead). The above example for
conditionals would look like this:

```html
<switch {weather}>
  <case {'sunny'}>

    <Sun />

  <case {'mostly sunny'}>

    <Sun />
    <Cloud />

  <case {cloudy} if {cloudy == 'cloudy'}>

    <Cloud />
    <Cloud />
    <Cloud />

  <case {_}>

    <Rain />

</switch>
```

### For

For loops are pretty straight forward:

```html
<for {day in forecast}>
  <WeatherIcon day={day} />
</for>
```

### Let

You can define variables with `<let>` and access them within the tag.

```html
<let foo={new Foo()} ids={[1,2,3,4]}>
  <for {id in ids}>
    <button onClick={foo.handleClick(id)}>Test</button>
  </for>
</let>
```
