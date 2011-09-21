package sprites 
{
	import org.flixel.FlxSprite;
	
	/**
	 * Used for drawing grids.
	 * @author Michal J Wallace
	 */
	public class Empty extends FlxSprite 
	{
		
		public function Empty(x:Number, y:Number)
		{
			super(x, y, Tetraminex.ImgEmpty);
		}
		
	}

}