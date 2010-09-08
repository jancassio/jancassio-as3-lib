package jancassio.modules.net
{
	import flash.net.URLRequest;
	/**
	 * Shortcut for no cache requests.
	 * @author janio | janio@jancassio.com
	 */
	public function noCache (url : String) : URLRequest
	{
		return new URLRequest( timeStamp(url) );
	}
}
