package  com.tetraminex.core
{
	import org.flixel.*;
	import org.gamesketchlib.ui.GsTeleType;

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
		protected var mTeletype:GsTeleType     = new GsTeleType (kX + 110, kY +  50, 400);
		protected var mNextText:FlxText        = new FlxText  (kX + 315, kY + 195, 150, "[press enter]");
		
		public static const instance:TalkWindow = new TalkWindow();
		
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
		
		public function talk(ImgClass:Class, name:String, color:uint, text:String, angle:Number = 0):void
		{
			this.visible = true;
			mNextText.visible = false;
			mSpeakerSprite.loadGraphic(ImgClass, true);
			mNameText.text = name;
			mTeletype.color = color;
			mTeletype.fullText = text;			
			mSpeakerSprite.angle = angle;
		}
		
		public function teddy(text:String, angle:int = 0 ):void
		{
			this.talk(Assets.ImgTeddy, "Teddy", 0xffff66ff, text, angle);
		}

		public function ernie(text:String, angle:int = 0 ):void
		{
			this.talk(Assets.ImgHero, "Ernie", 0xffffff66, text, angle);
		}
		
		public function ivan(text:String, angle:int = 0 ):void
		{
			this.talk(Assets.ImgIvan, "Ivan", 0xff66ffff, text, angle);
		}
		
		
	}

}