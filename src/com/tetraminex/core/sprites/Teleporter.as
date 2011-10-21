package com.tetraminex.core.sprites 
{
	import org.flixel.*;
	import com.tetraminex.core.scripts.*;
	
	public class Teleporter extends GridSprite 
	{
		
		public var star:FlxSprite;
		public var shadow:FlxSprite;
		
		private var mTickCount:int = 0;
		private var mStepCount:int = 0;
		private const mMaxSteps:int = 16;
		
		public function Teleporter(x:Number, y:Number) 
		{
			super(x, y);
			this.loadGraphic(Assets.ImgTeleporter, true);
			this.addAnimation("glow", [1, 2, 3, 4, 3, 2], 8, true);
			this.play("glow");
			
			this.star = new FlxSprite(x, y);
			this.star.loadGraphic(Assets.ImgTeleporterStar, true);
			
			this.shadow = new FlxSprite(0, 0);
			this.shadow.makeGraphic(FlxG.width, FlxG.height, 0x0);
		}
		
		
		override public function update():void 
		{
			super.update();
			
			this.star.visible = this.shadow.visible = held;
			
			if (held)
			{
				this.star.x = this.x;
				this.star.y = this.y;
			}
			else if (mTickCount != 0)
			{
				mStepCount = 0;
				this.star.scale.x = 1;
				this.star.scale.y = 1;
				this.play("glow");
				this.shadow.makeGraphic(FlxG.width, FlxG.height, 0x0);
				mTickCount = 0;
			}
			
			if (held && ScriptManager.instance.atTick)
			{
				
				if (++mTickCount % 24)
				{
					this.star.frame =((this.star.frame + 1) % this.star.frames);
				}
				if (mTickCount % 64)
				{
					if (++mStepCount == mMaxSteps)
					{
						Script.begin.toBeContinued();
					}
					else if (mStepCount < mMaxSteps)
					{
						this.shadow.makeGraphic(FlxG.width, FlxG.height, 0x11000000 * mStepCount);
						this.star.scale.x += 0.2;
						this.star.scale.y += 0.2;
					}
				}
				this.frame = 0;
				this.play(null);
			}
			
		}		
	}

}