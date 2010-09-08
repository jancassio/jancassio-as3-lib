package jancassio.modules.sys
{
	import jancassio.enums.PlayerType;
	import flash.system.Capabilities;
	
	/**
	 * Shortcut to check if application is running on browser or not.
	 * @author janio | janio@jancassio.com
	 */
	public function isBrowser () : Boolean 
	{
		return	Capabilities.playerType == PlayerType.ACTIVE_X
				|| Capabilities.playerType == PlayerType.PLUG_IN;
	}
}
