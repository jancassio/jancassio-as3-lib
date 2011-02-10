package jancassio.utils.display 
{
	import jancassio.modules.display.frameLabelOf;
	import jancassio.utils.IDisposable;

	import flash.display.MovieClip;
	import flash.events.Event;

	/**
	 * Simple movieclip with added to stage implement and some extra killer features.
	 * 
	 * @author janio | janio@jancassio.com
	 * @version 1.2
	 * @usage
	 * 	1 - Extends it.
	 * 	2 - Override class initialization ("conf" to configure clas before displays it and "init" after added to display list).
	 * 	3 - Make your script normaly.
	 */
	public class MovieClipEx extends MovieClip implements IDisposable
	{
		
		// playTo fields
		private var _playToFrm : int;
		private var _playToCbk : Function;
		private var _isPaused : Boolean;
		
		public function MovieClipEx () 
		{
			conf();
		}
		
		/**
		 * Executes before this added to stage. Pretty to initialize some controls.
		 */
		protected function conf():void
		{
			_playToFrm = 0;
			_isPaused = false;
			(stage) ? init() : addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * Executes before added to stage. Pretty to setup display objects.
		 */
		protected function init():void
		{
			
		}
		
		protected function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			init();
		}
		
		
		/**
		 * Playbacks until selected frame.
		 * @param	frame		The frame destination.
		 * @param	callback	A function to execute after finish playback.
		 */
		public function playTo (frame : uint, callback : Function = null) : void
		{
			_playToFrm = frame;
			_playToCbk = callback;
			if(_playToFrm > 0) addEventListener(Event.ENTER_FRAME, onPlayTo);
		}
		
		/**
		 * Playbacks until selected frame label.
		 * @param	name		The frame label destination.
		 * @param	callback	A function to execute after finish playback.
		 */
		public function playToLabel (name : String, callback : Function = null) : int
		{
			var frame : int;
			
			frame = frameLabelOf(this, name).frame;
			playTo( frame , callback );
			
			return frame;
		}
		
		/**
		 * Toggle pause when use playTo to playbacks a timeline.
		 */
		public function pause () : void
		{
			_isPaused = !_isPaused;
			(_isPaused)
				? removeEventListener( Event.ENTER_FRAME, onPlayTo)
				: addEventListener(Event.ENTER_FRAME, onPlayTo);
		}
		
		/**
		 * Stops the playhead in the movie clip and cancel playTo if it is used to playbacks the timeline.
		 */
		override public function stop():void 
		{
			_playToFrm = 0;
			super.stop();
		}
		
		
		private function onPlayTo(e:Event):void 
		{
			if (currentFrame == _playToFrm || _playToFrm == 0)
			{
				removeEventListener( Event.ENTER_FRAME, onPlayTo);
				if(_playToCbk != null) _playToCbk();
			}
			else if (currentFrame < _playToFrm) nextFrame();
			else if (currentFrame > _playToFrm) prevFrame();
		}
		
		
		
		
		
		/* INTERFACE jancassio.interfaces.IDisposable */
		
		/**
		 * Memory saver.
		 */
		public function dispose():void
		{
			_playToFrm = 0;
			_playToCbk = undefined;
			_isPaused = false;
		}
	}
	
}