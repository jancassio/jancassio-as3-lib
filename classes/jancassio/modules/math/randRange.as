package jancassio.modules.math
{ 
  /**
   * Return a random number between mim and max values.
   * @param min Number 
   * @param max Number 
   * @return Number 
   */
  public function randRange (min : Number, max : Number) : Number
  {
    return min + ( Math.random() * (max - min) );
  }
}