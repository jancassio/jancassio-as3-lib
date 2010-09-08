package jancassio.utils.display 
{

	/**
	 * Basic interface of common loading assets.
	 * @author janio | janio@jancassio.com
	 */
	public interface ILoading 
	{
		/**
		 * A message or any text info to displays in loading.
		 */
		function get label () : String
		function set label (value : String) : void
		
		/**
		 * The progress status.
		 */
		function get progress () : Number
		function set progress (value : Number) :void
	}
}
