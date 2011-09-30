package sprites 
{
	import org.flixel.FlxPoint;

	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Block extends GridSprite 
	{
		
		private var mColor:int;
		private var mLocked:Boolean = false;
		
		public function Block(x:Number, y:Number)
		{
			super(x, y);
			loadGraphic(Assets.ImgBlock, true, false, Room.kCellW, Room.kCellH);
			
			solid = true;
			immovable = false;
		}
		
		override public function canMove(dir:FlxPoint):Boolean 
		{			
			return super.canMove(dir);
		}
		
		public function setColorByName(name:String):void
		{
			mColor = Color.map[name];
			updateFrame();
		}
		public function setColor(color:int):void
		{
			mColor = color;
			updateFrame();
		}
		
		public function getColor():int
		{
			return mColor;
		}
		
		public function lock():void
		{
			immovable = true;
			mLocked = true;
			updateFrame();
		}
		public function unLock():void
		{
			immovable = false;
			mLocked = false;
			updateFrame();
		}
		
		
		private function updateFrame():void 
		{
			frame = mColor + (mLocked ? 8 : 0);
		}
		
		
	}

}