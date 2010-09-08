package jancassio.modules.net
{
	/**
	 * Generates a noCache time stamp based query string.
	 * @author janio | janio@jancassio.com
	 */
	public function timeStamp (source : String) : String {
		var date : Date;
		
		date = new Date;
		return source + '?noCache='
			+ date.fullYear + "-"
			+ date.month + "-"
			+ date.minutes + "-"
			+ date.seconds;
	}
}
