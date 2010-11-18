package jancassio.events
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * Class for dispatch event in a certain frame or label (or both). 
	 * @author janio
	 * 
	 */	
	public class TimelineEvent extends Event
	{
		
		/** Frame event type */
		public static const FRAME : String = "frame";
		
		/** Label event type */
		public static const LABEL : String = "label";
		
		
		/**
		 * The current frame number.
		 * @return
		 *  
		 */
		public function get frame () : int
		{
			return (currentTarget as MovieClip).currentFrame;
		}
		
		/**
		 * The current frame label.
		 * @return 
		 * 
		 */		
		public function get label () : String
		{
			return (currentTarget as MovieClip).currentFrameLabel;
		}
		
		
		
		
		
		/**
		 * Initialize a new FrameEvent instance.
		 * 
		 * @param type Type of event (FRAME by default).
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function TimelineEvent (
			type:String = "frame",
			bubbles:Boolean=false,
			cancelable:Boolean=false
		)
		{
			super(type, bubbles, cancelable);
		}
		
		
		/**
		 * Clones the current event. 
		 * @return 
		 * 
		 */		
		override public function clone () : Event
		{
			return new TimelineEvent;
		}
		
		
		override public function toString () : String
		{
			return formatToString(
				"TimelineEvent",
				"type",
				"frame",
				"frame",
				"bubbles",
				"cancelable"
			); 
		}
	}
}