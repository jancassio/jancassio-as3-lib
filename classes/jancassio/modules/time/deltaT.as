package jancassio.modules.time
{
	/**
	 * Fast way to get the difference between two dates.
	 * 
	 * @param start The start date event (A static date, not now).
	 * @param end The expire date.
	 * @return deltaT from this two dates.
	 * 
	 * @author janio | janio@jancassio.com
	 * 
	 */
	public function deltaT (start : Date, end : Date) : int 
	{
		return end.time - ( start.time + (new Date).time );
	}
}
