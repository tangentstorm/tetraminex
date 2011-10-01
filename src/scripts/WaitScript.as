package scripts 
{
	import org.flixel.*;
	
	public class WaitScript implements IScript 
	{
		
		private var mSeconds:Number = 0;
		private var mPassed:Number = 0;
		
		public function WaitScript(seconds:Number) 
		{
			mSeconds = seconds;
		}
		
		/* INTERFACE scripts.IScript */
		
		public function begin():void 
		{
			mPassed = 0;
		}
		
		public function onFrame():void 
		{
			mPassed += FlxG.elapsed;			
		}
		
		public function onTick():void 
		{
		}
		
		public function isFinished():Boolean 
		{
			return mPassed > mSeconds;
		}
		
		public function isModal():Boolean 
		{
			return false;
		}
		
	}

}