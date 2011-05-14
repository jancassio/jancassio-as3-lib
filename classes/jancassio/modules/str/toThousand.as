package jancassio.modules.str
{

	/**
	 * Formats a number greater than 999.
	 * @example
	 * trace( toThousand( 12345 ) ); // 12.345
	 * @param number Number
	 * @return String 
	 */
	public function toThousand (number : Number) : String
	{
		var r : String 		// result
		var f : int;			// format number index
		var s : String;		// number to string
		var i : int;
		
		r = "";
		f = 2;
		s = number.toString();
		i = s.length;
		
		if( number < 1000 ) return number.toString();
		
		while(i--)
		{
			r = s.substr(i, 1) + r;

			if(!f-- && i)
			{
				r = "." + r;
				f = 2;
			}
		}
		
		return r;
	}
	
}

