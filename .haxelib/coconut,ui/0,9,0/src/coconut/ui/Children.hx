package coconut.ui;

@:pure
abstract Children(Array<RenderResult>) from Array<RenderResult> {
  public var length(get, never):Int;
    inline function get_length()
      return if (this == null) 0 else this.length;

  @:arrayAccess public inline function get(index:Int)
    return if (this == null) null else this[index];

  @:from static function ofSingle(r:RenderResult):Children
    return [r];

  public function concat(that:Array<RenderResult>):Children
    return if (this == null) that else this.concat(that);
}