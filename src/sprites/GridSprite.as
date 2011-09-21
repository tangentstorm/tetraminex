package sprites 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class GridSprite extends FlxSprite 
	{
		
		public var gx:int;
		public var gy:int;
		public var grid:Room;
		
		public function GridSprite(x:Number = 0, y:Number = 0)
		{
			super(x, y);
		}
		
		public function canMove(dir:FlxPoint):Boolean
		{		
			return !(immovable || grid.neighbor(this, dir).solid);
		}
			
	}

}