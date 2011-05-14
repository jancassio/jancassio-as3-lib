package jancassio.utils.sys 
{	
	import flash.net.LocalConnection;
	
	
	/**
	 * Opens two local connections with same name, calls the dustman
	 * immediately
	 */
	public function forceGC () : void
	{
		try
		{
			(new LocalConnection).connect("__DUSTMAN__");
			(new LocalConnection).connect("__DUSTMAN__");
		}
		catch (e:Error) {};
	}
}
