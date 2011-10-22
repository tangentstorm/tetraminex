package com.tetraminex.core.scripts
{
	import org.flixel.*;
	import com.tetraminex.core.PlayState;
	
	public class FadeToBlackScript implements IScript 
	{
		private var mCount:Number = 0;
		private const mMaxCount :Number = 0xf;
		private var mReverse:Boolean = false;
		private var mFast:Boolean = false;
		private var mCurtain:FlxSprite;
		
		private static var firstTime:Boolean = true;
				
		public function FadeToBlackScript(reverse:Boolean = false, fast:Boolean=false)
		{
			mReverse = reverse;
			mFast = fast;
		}
		
		/* INTERFACE scripts.IScript */
		
		public function begin():void 
		{
			mCount = mReverse ? mMaxCount : 0;
			mCurtain = PlayState.curtain;
			mCurtain.makeGraphic(FlxG.width, FlxG.height, 0x11000000 * mCount);
		}
		
		public function onFrame():void 
		{
			
		}
		
		public function onTick():void 
		{
			mCount += (mReverse ? -1 : 1)  * (mFast ? 2 : 1);
			if (mCount < 0) mCount = 0;
			if (mCount > mMaxCount) mCount = mMaxCount;
			mCurtain.makeGraphic(FlxG.width, FlxG.height, 0x11000000 * mCount);
		}
		
		public function isFinished():Boolean 
		{
			return mReverse ? mCount <= 0 : mCount >= mMaxCount;
		}
		
		public function isModal():Boolean 
		{
			return true;
		}
		
	}

}