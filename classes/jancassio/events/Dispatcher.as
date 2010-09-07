package jancassio.events 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * EventDispatcher replacer, this class has better performance and some extra features.
	 * @author janio | janio@jancassio.com
	 */
	public class Dispatcher implements IDispatcher
	{
		protected var dispatcher : EventDispatcher;
		
		/**
		 * Creates a new Dispatcher instance.
		 * @constructor
		 */
		public function Dispatcher() 
		{
			dispatcher = new EventDispatcher(this);
		}
		
		public function addEventListener(
			type:String,
			listener:Function,
			useCapture:Boolean = false,
			priority:int = 0,
			useWeakReference:Boolean = false
			):void
		{
			dispatcher.addEventListener(type,
				listener,
				useCapture,
				priority,
				useWeakReference
			);
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			if ( dispatcher.hasEventListener(event.type) || event.bubbles )
				return dispatcher.dispatchEvent(event);
			
			return true;
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return dispatcher.hasEventListener(type);
		}
		
		public function removeEventListener(
			type:String,
			listener:Function,
			useCapture:Boolean = false
			):void
		{
			dispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function willTrigger(type:String):Boolean
		{
			return dispatcher.willTrigger(type);
		}
	}
}