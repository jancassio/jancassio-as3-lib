package jancassio.modules.display
{
	import flash.display.FrameLabel;
	import flash.display.MovieClip;
	
	/**
	* Get the current timeline's Frame label.
	* @author janio | janio@jancassio.com
	*/
	public function frameLabelOf (target : MovieClip, label : String) : FrameLabel
	{
		var frameLabel : FrameLabel;
		
		for each( frameLabel in target.currentLabels )
			if(frameLabel.name == label) break;
			else frameLabel = null;
		
		return frameLabel;
	}
}