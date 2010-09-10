package jancassio.utils.display 
{
	import jancassio.interfaces.IDisposable;

	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;

	/**
	 * Sprite object with extra features.
	 * @author janio | janio@jancassio.com
	 */
	public class SpriteEx extends Sprite implements IDisposable
	{
		public function SpriteEx ()
		{
			conf();
		}
		
		public function dispose () : void
		{
			throw new IllegalOperationError("This method must be implemented");
		}

		
		protected function conf () : void 
		{
			(stage) ? init() : addEventListener(Event.ADDED_TO_STAGE, onAddedToStage );
		}

		
		protected function init () : void 
		{
			// initialize 
		}

		
		private function onAddedToStage (event : Event) : void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			init();
		}
	}
}
