package com.tangentcode.flixelbits 
{
	import org.flixel.FlxText;

	public class TeleType extends FlxText 
	{
		
		private var mFullText:String;
		private var mCounter:int = 0;
		private var mFinished:Boolean = false;
		
		public function TeleType(X:Number, Y:Number, Width:uint, Text:String=null, EmbeddedFont:Boolean=true) 
		{
			super(X, Y, Width, "", EmbeddedFont);
			this.fullText = Text;
		}
		
		override public function update():void 
		{
			super.update();
			if (!mFinished)
			{
				this.text = mFullText.substr(0, mCounter++);
				mFinished = mCounter > mFullText.length;
			}
		}
		
		public function set fullText(newText:String):void
		{
			this.text = "";
			mCounter = 0;
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
