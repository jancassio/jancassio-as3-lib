package jancassio.modules.img 
{
	import flash.display.DisplayObject;
	
	/**
	 * Apply proportional image resize.
	 * @author Jan Cassio | janio@jancassio.com
	 */
	public function resizeImage (image : DisplayObject, width : Number, height : Number) : void
	{
		image.width = width;
		image.height = height;
		image.scaleX = image.scaleY = Math.max(image.scaleX, image.scaleY);
	}
}
