package jancassio.modules.time
{
	/**
	 * Checks times ago based on date param.
	 * Replace the flags to displays the correct text based on offset.
	 * Flags: ${sec(s)} | ${min(s)} | ${hour(s)} | ${day(s)} | 
	 * ${week(s)} | ${at} | ${slash} | ${colon} | ${ago}
	 * 
	 * @author janio | janio@jancassio.com
	 * @example
	 * <code>
	 * 
	 * var timesAgo = jancassio.modules.time.timesAgo( myTime );
	 * trace( timesAgo ) // N ${secs} ${ago}
	 * 
	 * </code>
	 */
	public function timesAgo (date : Date) : String 
	{
		var now:Date;
		var offset:int;
		var times:String;
		var period : Number;
		
		now = new Date;
		offset = (now.time - date.time) / 1000;
		
		
		if (offset < 60)
		{
			period = Math.round( offset / 60 );
			times = period + (" ${sec" + ((period > 1) ? "s" : "") + "}");
		}
		else if (offset < 3600)
		{
			period = Math.round( offset / 60 );
			times = period + (" ${min" + ((period > 1) ? "s" : "") + "}");
		}
		else if (offset < 86400)
		{
			period = Math.round( offset / 3600 );
			times = period + (" ${hour" + ((period > 1) ? "s" : "") + "}");
		}
		else if (offset < 604800)
		{
			period = Math.round(offset / 86400);
			times = period + (" ${day" + ((period > 1) ? "s" : "") + "}");
		}
		else if (offset < 2678400)
		{
			period = Math.round(offset / 604800);
			times = period + (" ${week" + ((period > 1) ? "s" : "") + "}");
		}
		else
		{
			return date.getDate() + "${slash}"
			+ (date.getMonth() + 1) + "${slash}"
			+ date.getFullYear() + " ${at} "
			+ date.getHours() + "${colon}"
			+ date.getMinutes();
		}
		
		return times + " ${ago}";
	}
}
