package com.tetraminex.core.scripts
{
	import org.flixel.*;
	
	public class FadeToBlackScript implements IScript 
	{
		
		private var mCurtain:FlxSprite = new FlxSprite(0, 0);
		private var mCount:Number = 0;
		private const mMaxCount :Number = 0xf;
		private var mReverse:Boolean = false;
		
		public function FadeToBlackScript(reverse:Boolean = false)
		{
			mReverse = reverse;
		}
		
		/* INTERFACE scripts.IScript */
		
		public function begin():void 
		{
			FlxG.state.add(mCurtain);
			mCount = mReverse ? mMaxCount : 0;
			mCurtain.makeGraphic(FlxG.width, FlxG.height, 0x11000000 * mCount);
		}
		
		public function onFrame():void 
		{
			
		}
		
		public function onTick():void 
		{
			mReverse ? mCount-- : mCount++;
			mCurtain.makeGraphic(FlxG.width, FlxG.height, 0x11000000 * mCount);
		}
		
		public function isFinished():Boolean 
		{
			return mReverse ? mCount == 0 : mCount >= mMaxCount;
		}
		
		public function isModal():Boolean 
		{
			return true;
		}
		
	}

}