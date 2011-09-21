package sprites 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Wall extends GridSprite
	{
		
		public function Wall(x:Number=0, y:Number=0) 
		{
			super(x, y);
			makeGraphic(Room.kCellH, Room.kCellW, 0x99666666);
			solid = true;
			visible = true;
			immovable = true;
			moves = false;
		}
		
	}

}