package sprites 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class NullSprite extends GridSprite
	{
		
		public function NullSprite(x:Number=0, y:Number=0) 
		{
			super(x, y);
			solid = false;
			visible = false;
			immovable = true;
			exists = false;
		}
		
	}

}