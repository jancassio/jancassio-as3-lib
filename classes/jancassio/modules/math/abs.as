package jancassio.modules.math
{	
  /**
   * Returns the absolute value of a number.
   * If number is less than zero, example -1, the returned value is 1 positive.
   * 
   * @param value Number 
   * @return Number 
   */
	public function abs (value : Number) : Number
	{
		return (value < 0) ? -value : value;
	}
}