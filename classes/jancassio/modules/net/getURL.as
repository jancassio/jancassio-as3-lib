package jancassio.modules.net
{
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	/**
	 * Old school url redirect.
	 * @author janio | janio@jancassio.com
	 */
	public function getURL (url : String, target : String = 'self') : URLRequest
	{
		var request : URLRequest;
		
		request = new URLRequest( url );
		navigateToURL(request, target);
		return request;
	}
}
