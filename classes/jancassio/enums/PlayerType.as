package jancassio.enums
{

	/**
	 * List of player types.
	 * @author janio | janio@jancassio.com
	 */
	public final class PlayerType 
	{
		/**
		 * The app is running on ActiveX (Internet Explorer).
		 */
		public static const ACTIVE_X	: String = "ActiveX";
		
		/**
		 * The app is running on Desktop (Adobe AIR).
		 */
		public static const DESKTOP		: String = "Desktop";
		
		/**
		 * The app is running on PlugIn (Netscape based browsers).
		 */
		public static const PLUG_IN		: String = "PlugIn";
		
		/**
		 * The app is running on External context (Flash IDE).
		 */
		public static const EXTERNAL	: String = "External";
		
		/**
		 * The app is running on Standalone player.
		 */
		public static const STAND_ALONE	: String = "StandAlone";
	}
}
