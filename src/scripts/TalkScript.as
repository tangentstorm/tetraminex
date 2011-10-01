package scripts 
{
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class TalkScript implements IScript 
	{
		
		private var mSpeaker:String;
		private var mText:String;
		private var mAngle:Number = 0;
		public function TalkScript(speaker:String, text:String, angle:Number=0) 
		{
			mSpeaker = speaker;
			mText = text;
			mAngle = angle;
		}
		
		/* INTERFACE scripts.IScript */
		
		public function begin():void 
		{
			TalkWindow.instance[mSpeaker](mText, mAngle);
		}
		
		public function onFrame():void 
		{
			
		}
		
		public function onTick():void 
		{
			
		}
		
		public function isFinished():Boolean 
		{
			// it's not enough for the teletype to be finished, because
			// the user has to press a key when they're done reading.
			return ! TalkWindow.instance.visible;
		}
		
		public function isModal():Boolean 
		{
			return TalkWindow.instance.visible;
		}
		
	}

}