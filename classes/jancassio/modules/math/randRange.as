package jancassio.modules.math
{ 
  public function randRange (min : Number, max : Number) : Number
  {
    return min + ( Math.random() * (max - min) );
  }
}