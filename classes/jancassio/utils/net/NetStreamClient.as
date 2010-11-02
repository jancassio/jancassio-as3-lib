package jancassio.utils.net
{	
	import potato.core.IDisposable;
	import flash.net.NetStream;
	import flash.events.IEventDispatcher;
	import jancassio.events.NSClientEvent;
	import flash.events.Event;
	
	/**
	 * Provides a advanced interface to handles NetStream client object.
	 * @author janio | janio@jancassio.com
	 */
	public class NetStreamClient implements IDisposable, IEventDispatcher
	{
		protected var _netstream : NetStream;
		
		
		protected var _cuePoint		: Object;
		protected var _imageData	: Object;
		protected var _metaData		: Object;
		protected var _playStatus	: Object;
		protected var _textData		: Object;
		protected var _xmpData		: Object;
		protected var _listener		: Object;
		
		/**
		 * @constructor
		 */
		public function NetStreamClient ( netstream : NetStream )
		{
			_netstream  = netstream;
			_cuePoint   = {};
			_imageData  = {};
			_metaData   = {};
			_playStatus = {};
			_textData   = {};
			_xmpData	= {};
			_listener	= {};
			
			_listener.onXMPData    = onXMPData;
			_listener.onTextData   = onTextData;
			_listener.onPlayStatus = onPlayStatus;
			_listener.onMetaData   = onMetaData;
			_listener.onImageData  = onImageData;
			_listener.onCuePoint   = onCuePoint;
			
			_netstream.client = _listener;
		}
		
		/**
		 * The current netstream object.
		 */
		public function get netstream () : NetStream
		{
			return _netstream ;
		}
		
		/**
		 * The netstream client recived cue point.
		 */
		public function get cuePoint () : Object
		{
			return _cuePoint ;
		}
		
		/**
		 * The netstream client recived image date.
		 */
		public function get imageData () : Object
		{
			return _imageData ;
		}
		
		/**
		 * The netstream client recived meta data.
		 */
		public function get metaData () : Object
		{
			return _metaData ;
		}
		
		/**
		 * The netstream client recived play status.
		 */
		public function get playStatus () : Object
		{
			return _playStatus ;
		}
		
		/**
		 * The netstream client recived text data.
		 */
		public function get textData () : Object
		{
			return _textData ;
		}
		
		/**
		 * The netstream client recived xmp data.
		 */
		public function get xmpData () : Object
		{
			return _xmpData ;
		}
		
		
		
		
		/**
		 * @inheritDoc
		 */
		public function addEventListener(
			type:String,
			listener:Function,
			useCapture:Boolean = false,
			priority:int = 0,
			useWeakReference:Boolean = false
			):void
		{
			netstream.addEventListener(
				type,
				listener,
				useCapture,
				priority,
				useWeakReference
			);
		}
		
		
		
		
		/**
		 * @inheritDoc
		 */
		public function dispatchEvent(event:Event) : Boolean
		{
			return netstream.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return netstream.hasEventListener(type);
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeEventListener(
			type:String,
			listener:Function,
			useCapture:Boolean = false
			):void
		{
			netstream.removeEventListener(
				type,
				listener,
				useCapture
			);
		}
		
		/**
		 * @inheritDoc
		 */
		public function willTrigger(type:String):Boolean
		{
			return netstream.willTrigger(type);
		}
		
		
		
		
		/**
		 * @inheritDoc
		 */
		public function dispose () : void
		{
			var p : String;
			
			_netstream.client.onCuePoint   = null;
			_netstream.client.onImageData  = null;
			_netstream.client.onMetaData   = null;
			_netstream.client.onPlayStatus = null;
			_netstream.client.onTextData   = null;
			_netstream.client.onXMPData    = null;
			_netstream  = null;
			_cuePoint   = null;
			_imageData  = null;
			_metaData   = null;
			_playStatus = null;
			_textData   = null;
			_xmpData	= null;
			
			for ( p in _listener ) _listener[p] = null;
			
			_listener = null;
		}
		
		
		
		protected function onCuePoint (data : Object) : void
		{
			_cuePoint = data;
			dispatchEvent( new Event( NSClientEvent.CUE_POINT ) );
		}
		
		
		protected function onImageData (data : Object) : void
		{
			_imageData = data;
			dispatchEvent( new Event( NSClientEvent.IMAGE_DATA ) );
		}
		
		
		protected function onMetaData (data : Object) : void
		{
			_metaData = data;
			dispatchEvent( new Event( NSClientEvent.META_DATA ) );
		}
		
		
		protected function onPlayStatus (data : Object) : void
		{
			_playStatus = data;
			dispatchEvent( new Event( NSClientEvent.PLAY_STATUS ) );
		}
		
		
		protected function onTextData (data : Object) : void
		{
			_textData = data;
			dispatchEvent( new Event( NSClientEvent.TEXT_DATA ) );
		}
		
		
		protected function onXMPData (data : Object) : void
		{
			_xmpData = data;
			dispatchEvent( new Event( NSClientEvent.XMP_DATA ) );
		}
		
		
	}
}