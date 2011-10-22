package com.tetraminex.core.scripts 
{
	import org.flixel.*;
	import com.tetraminex.core.*;
	
	public class ScriptManager
	{
		
		private static var mQueue:Array = [];
		private static var mTalkWindow:TalkWindow;
		private static var mTimeSinceTick:Number = 0;
		private static var mCurrentScript:IScript = NullScript.instance;
		
		public static var locked:Boolean = false;
		
		public static var tickInterval:Number = 0.10;
		public static var atTick:Boolean = false;		
		
		public static var instance:ScriptManager = new ScriptManager();
		private static var instanceCount:int = 0;
		
		public static function push(script:IScript):void
		{
			if (mTalkWindow == null) mTalkWindow = TalkWindow.instance;
			mQueue.push(script);
		}
		
		public static function abort():void
		{
			mCurrentScript = NullScript.instance;
			mQueue = [];
		}
		
		public static function update():void
		{			
			mTimeSinceTick += FlxG.elapsed;
			if (mTimeSinceTick < tickInterval)
			{
				atTick = false;
			}
			else
			{
				mTimeSinceTick = 0;
				atTick = true;
				mCurrentScript.onTick();
			}
			mCurrentScript.onFrame();
			
			if (mCurrentScript.isFinished())
			{
				mCurrentScript = (mQueue.length > 0) ? mQueue.shift() as IScript : NullScript.instance;
				mCurrentScript.begin();
			}
		}
		
		public static function isModal():Boolean
		{
			return locked || mTalkWindow.visible;
		}		
	}
}
