package scripts 
{
	import org.flixel.*;
	
	public class ScriptManager
	{
		
		private var mQueue:Array = [];
		private var mTalkWindow:TalkWindow;
		private var mTimeSinceTick:Number = 0;
		private var mCurrentScript:IScript = NullScript.instance;
		
		public var locked:Boolean = false;
		
		public var tickInterval:Number = 0.10;
		public var atTick:Boolean = false;		
		
		public static var instance:ScriptManager = new ScriptManager();
		private static var instanceCount:int = 0;
		
		public function ScriptManager(talkWindow:TalkWindow = null) 
		{
			if (++instanceCount != 1)
			{ 
				throw new Error("ScriptManager is a singleton. Use ScriptManager.instance instead.");
			}
			mTalkWindow = (talkWindow != null) ? talkWindow : TalkWindow.instance;
		}
		
		public static function push(script:IScript):void
		{
			instance.mQueue.push(script);
		}
		
		public function update():void
		{			
			mTimeSinceTick += FlxG.elapsed;
			if (mTimeSinceTick < this.tickInterval)
			{
				this.atTick = false;
			}
			else
			{
				mTimeSinceTick = 0;
				this.atTick = true;
				mCurrentScript.onTick();
			}
			mCurrentScript.onFrame();
			
			if (mCurrentScript.isFinished())
			{
				mCurrentScript = (mQueue.length > 0) ? mQueue.shift() as IScript : NullScript.instance;
				mCurrentScript.begin();
			}
		}
		
		public function isModal():Boolean
		{
			return this.locked || mTalkWindow.visible;
		}		
	}
}
