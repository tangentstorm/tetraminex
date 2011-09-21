package sprites 
{

	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Door extends GridSprite 
	{
		
		public function Door(x:Number, y:Number)
		{
			super(x, y);
			loadGraphic(Tetraminex.ImgDoor, true, false, 30, 30);
			solid = true;
			immovable = true;
			
			addAnimation('vertical', 	[0]);
			addAnimation('horizontal',  [3]);
		}
		
	}

}