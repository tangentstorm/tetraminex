package sprites 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class MrT extends GridSprite 
	{
		
		public function MrT(x:Number=0, y:Number=0) 
		{
			super(x, y);
			loadGraphic(Assets.ImgTeddy, true, false);
			immovable = true;
		}
		
	}

}