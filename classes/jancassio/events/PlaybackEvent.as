package jancassio.events 
{
	import flash.events.Event;

	/**
	 * @author janio | janio@jancassio.com
	 */
	public final class PlaybackEvent extends Event 
	{
		public static const CHANGE			: String = "change";
		public static const COMPLETE		: String = "complete";
		public static const CLOSE			: String = "close";
		public static const MUTE			: String = "mute";
		public static const VOLUME			: String = "volume";
		public static const DURATION		: String = "duration";
		
		public var volume : Number;
		public var muted : Boolean;
		public var duration : Number;
		public var position : Number;
		public var loaded : Number;
		
		
		public function PlaybackEvent (type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super( type, bubbles, cancelable );
		}
		
		override public function clone () : Event
		{
			var e : PlaybackEvent;
			
			e = new PlaybackEvent(type, bubbles, cancelable);
			e.volume = volume;
			e.muted = muted;
			e.duration = duration;
			e.position = position;
			
			return e;
		}
		
		override public function toString () : String
		{
			return formatToString("PlaybackEvent", type, bubbles, cancelable, volume, muted, duration, position, loaded);
		}
	}
}
