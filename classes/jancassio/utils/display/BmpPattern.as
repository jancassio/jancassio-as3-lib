package jancassio.utils.display
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Rectangle;

	/**
	 * Asset for bitmap pattern usage.
	 * @author janio | janio@jancassio.com
	 */
	public class BmpPattern extends Shape
	{
		private var _pattern : BitmapData;
		
		/**
		 * Generates a new BmpPattern instance.
		 * @constructor
		 */		public function BmpPattern ( pattern : BitmapData )
		{
			_pattern = pattern.clone();
		}
		
		
		
		
		/**
		 * The current pattern.
		 */
		public function get pattern () : BitmapData
		{
			return _pattern;
		}
		
		
		public function set pattern (pattern : BitmapData) : void
		{
			if(pattern != null) _pattern = pattern.clone();
		}



		/**
		 * Draws the pattern over area.
		 * Every time draws is called, the old draw data is disposed.
		 */
		public function draw ( area : Rectangle ) : void
		{
			graphics.clear();
			graphics.beginBitmapFill(_pattern);
			graphics.drawRect(area.x, area.y, area.width, area.height);
			graphics.endFill(); 
		}
	}
}
