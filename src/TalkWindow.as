package  
{
	import com.tangentcode.flixelbits.TeleType;
	import org.flixel.*;
	import sprites.MrT;

	/**
	 * This is the window that pops up when people are talking.
	 */
	public class TalkWindow extends FlxGroup
	{
		protected const kX:int = 15;
		protected const kY:int = 90;
		
		protected var mBackground:FlxSprite    = new FlxSprite( 0,   0);
		protected var mWindow:FlxSprite        = new FlxSprite(kX,       kY, Assets.ImgTalkWindow);
		protected var mSpeakerSprite:FlxSprite = new FlxSprite(kX +  40, kY +  50);
		protected var mNameText:FlxText        = new FlxText  (kX +  25, kY +  95, 60, "Speaker");
		protected var mTeletype:TeleType       = new TeleType (kX + 110, kY +  50, 400);
		protected var mNextText:FlxText        = new FlxText  (kX + 315, kY + 195, 150, "[press enter]");
		
		public function TalkWindow() 
		{
			super();
			
			mBackground.makeGraphic(FlxG.width, FlxG.height, 0xCC000000);
			
			var textGroup:FlxGroup = new FlxGroup();
			textGroup.add(mTeletype);
			textGroup.add(mNextText);
			textGroup.add(mNameText);
			
			mNameText.alignment = "center";
			
			textGroup.setAll("font", Assets.talkFont);
			textGroup.setAll("size", 17);
			textGroup.setAll("color", 0xff999999);
			
			mSpeakerSprite.scale = new FlxPoint(2 , 2);
			
			this.add(mBackground);
			this.add(mWindow);
			this.add(mSpeakerSprite);
			this.add(textGroup);
			
			this.visible = false;
		}
		
		
		override public function update():void 
		{
			super.update();
			
			mNextText.visible = mTeletype.doneTyping;
			
			if (FlxG.keys.justPressed("ENTER")
			|| (FlxG.keys.justPressed("ESCAPE")))
			{
				if (mTeletype.doneTyping)
					this.visible = false;
				else
					mTeletype.skipAhead();
			}
		}
		
		
		public function teddy(text:String, angle:int = 0 ):void
		{
			this.visible = true;			
			mSpeakerSprite.loadGraphic(Assets.ImgTeddy, true);
			mSpeakerSprite.angle = angle;
			mNameText.text = "Teddy";
			mTeletype.color = 0xffff66ff;
			mTeletype.fullText = text;
		}
		
		
	}

}