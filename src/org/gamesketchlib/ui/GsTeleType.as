package org.gamesketchlib.ui 
{
	import org.flixel.*;

	public class GsTeleType extends FlxText 
	{
		
		private var mFullText:String;
		private var mCounter:int = 0;
		private var mFinished:Boolean = false;
		
		private var mNextChar:Number = 0;
		private var mTicker:Number = 0;
		
		public function GsTeleType(x:Number, y:Number, w:uint, fullText:String="")
		{
			super(x, y, w, "", true);
			this.fullText = fullText;
		}
		
		override public function update():void 
		{
			super.update();
			if (!mFinished)
			{
				mTicker += FlxG.elapsed;
				if (mTicker > mNextChar)
				{
					mTicker = 0;
					mNextChar = Math.random() * 0.025;
					this.text = mFullText.substr(0, mCounter++);
					mFinished = mCounter > mFullText.length;
				}
			}
		}
		
		public function set fullText(newText:String):void
		{
			this.text = "";
			mCounter = 0;
			mTicker = 0;
			mNextChar = 0;
			mFullText = newText;
			mFinished = (newText == null) || (newText.length == 0);
		}
		
		
		public function skipAhead():void
		{
			this.text = mFullText;
			mFinished = true;
		}
		
		public function get doneTyping(): Boolean
		{
			return mFinished;
		}
		
	}
}
