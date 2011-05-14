package jancassio.modules.math
{ 
  
  /**
   * Convert radians to degrees units.
   * 
   * @param value Number 
   * @return Number 
   */
  public function radiansToDegrees (value : Number) : Number
  {
    return value * 180 / Math.PI;
  }
}