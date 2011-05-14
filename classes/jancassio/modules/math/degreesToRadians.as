package jancassio.modules.math
{ 
  
  /**
   * Convert degrees to radians units.
   * 
   * @param value Number 
   * @return Number 
   */
  public function degreesToRadians (value : Number) : Number
  {
    return value * Math.PI / 180;
  }
}