package jancassio.modules.math
{

  /**
   * Checks number is even, otherwise the number is odd. 
   * @param value Number 
   * @return Boolean 
   */
  public function isEven (value : Number) : Boolean
  {
	  return (value & 2) == 0;
  }

}

