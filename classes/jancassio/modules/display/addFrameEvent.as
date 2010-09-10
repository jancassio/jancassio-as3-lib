package jancassio.modules.display
{
	import flash.display.MovieClip;
	
	import jancassio.events.TimelineEvent;

	/**
	* Add Timeline event on selected frame.
	* @author janio | janio@jancassio.com
	*/ 
	public function addFrameEvent ( timeline : MovieClip, frame : int ) : void
	{
		timeline.addFrameScript(
			frame,
			timeline.dispatchEvent.apply(
				null,
				[ new TimelineEvent ]
			)
		);
	}
}