package jancassio.modules.str
{

  /**
	 * Fill string left spaces.
	 * 
	 * @param string String
	 * @param count int
	 * @param char String
	 * @private
	 */
	public function fillRight (string : String, count : int = 1, char : String = "0") : String
  {
    var r : String;
    var i : int;

    r = "";
    i = string.length;

    while(i++ < count) r += char;

    return string + r;
   }
	
}

