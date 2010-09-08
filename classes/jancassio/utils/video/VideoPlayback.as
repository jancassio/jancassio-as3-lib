package jancassio.utils.video 
{
	import jancassio.events.Dispatcher;
	import jancassio.events.PlaybackEvent;

	import flash.events.TimerEvent;
	import flash.media.SoundTransform;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.utils.Timer;

	/**
	 * Basic playback for any video format ou delivery mode.
	 * @author janio | janio@jancassio.com
	 */
	 public class VideoPlayback extends Dispatcher
	 {
		private var nc:NetConnection;
		private var ns:NetStream;
		private var _video:Video;
		private var _isPlaying:Boolean;
		private var soundTransf:SoundTransform;
		private var prevVolume:Number;
		private var _isMuted:Boolean;
		private var _duration:Number;
		private var playheadTimer:Timer;
		private var _url : String;
		
		public function VideoPlayback (url:String)
		{
			super();
			conf(url);
		}
		
		private function conf (url:String) : void
		{
			nc = new NetConnection();
			nc.connect(null);
			ns = new NetStream(nc);
			ns.client = {};
			ns.client[ "onMetaData" ] = onMetaData;
			//ns.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			ns.play(url);
			ns.pause();
			
			_url = url;
			_isPlaying = false;
			_isMuted = false;
			_duration = 0;
			soundTransf = new SoundTransform;
			prevVolume = 1;
			
			_video = new Video(513, 288);
			_video.attachNetStream(ns);
			
			setVolume(1);
			
			playheadTimer = new Timer(250);
			playheadTimer.addEventListener(TimerEvent.TIMER, onPlayheadTimer );
		}
		
		/*
		private function onNetStatus (event : NetStatusEvent) : void
		{
			trace("[ VideoPlayback ]: onNetStatus ");
			trace("\te: ", event);
			
			var p : String;
			
			for (p in event.info)
				trace("\t" + p, " = ", event.info[p]);
		}
		 */

		
		public function get video():Video
		{
			return _video;
		}
		
		public function playVideo():void 
		{
			if (_isPlaying == false)
			{
				ns.resume();
				_isPlaying = true;
				playheadTimer.start();
			
				//dispatchEvent(new Event("isPlayingChange"));
				dispatch(PlaybackEvent.CHANGE);
			}
		}
		 
		public function pauseVideo():void 
		{
			if (_isPlaying)
			{
				ns.pause();
				_isPlaying = false;
				playheadTimer.stop();
			
				//dispatchEvent(new Event("isPlayingChange"));
				dispatch(PlaybackEvent.CHANGE);
			}
		}
		
		public function stopVideo () : void
		{
			if(_isPlaying)
			{
				_isPlaying = false;
				playheadTimer.stop();
				ns.play(_url, 1);
				ns.pause();
				dispatch(PlaybackEvent.CLOSE);
			}
		}
		
		public function get isPlaying():Boolean
		{
			return _isPlaying;
		}
		
		public function set seek (value : Number) : void
		{
			ns.seek(value * _duration);
		}

		
		public function toggleMute():void
		{
			if (_isMuted)
			{
				_isMuted = false;
				
				setVolume(prevVolume);
			}
			else // !_isMuted
			{
				prevVolume = getVolume();
				
				setVolume(0);

				_isMuted = true;
			}
			
			
			//dispatchEvent(new Event("isMutedChange"));
			dispatch(PlaybackEvent.MUTE);
		}

		
		public function get isMuted():Boolean
		{
			return _isMuted;
		}
		
		public function setVolume(value:Number):void
		{
			// Only set the volume if we're not muted.
			if (isMuted)
			{
				prevVolume = value;
			}
			else if (value != soundTransf.volume)
			{
				soundTransf.volume = value;
				ns.soundTransform = soundTransf;
				
				//dispatchEvent(new Event("volumeChange"));
				dispatch(PlaybackEvent.VOLUME);
			}
		}
		
		public function getVolume():Number
		{
			return ns.soundTransform.volume;
		}
		
		public function get playhead():Number
		{
			return ns.time;
		}

		public function get duration():Number
		{
			return _duration;
		}
		
		private function onPlayheadTimer(event:TimerEvent):void
		{
			//dispatchEvent(new Event("playheadChange"));
			dispatch(PlaybackEvent.CHANGE);
		}
		
		private function onMetaData(info:Object):void
		{
			_duration = info[ "duration" ];
			
			//dispatchEvent(new Event("durationChange"));
			dispatch(PlaybackEvent.CHANGE);
		}

		
		private function dispatch (type : String) : void
		{
			var e:PlaybackEvent;
			
			e = new PlaybackEvent(type);
			
			e.muted = isMuted;
			e.duration = duration;
			e.position = ns.time;
			e.volume = soundTransf.volume;
			e.loaded = ns.bytesLoaded / ns.bytesTotal;
			
			dispatchEvent( e );
		}
	}
		
}
