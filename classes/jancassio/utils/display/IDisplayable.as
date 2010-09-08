package jancassio.utils.display 
{

	/**
	 * Simple show/hide interface for DisplayObject based types.
	 * @author janio | janio@jancassio.com
	 */
	public interface IDisplayable 
	{
		
		/**
		 * Shows the instance.
		 * @return
		 */
		function show () : *
		
		/**
		 * Hides the instance.
		 * @return 
		 */
		function hide () : *
	}
}
