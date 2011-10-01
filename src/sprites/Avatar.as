package sprites 
{
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Avatar extends GridSprite 
	{
		
		public function Avatar(x:Number=0, y:Number=0) 
		{
			super(x, y);
		}
		
		public function get faceDir():int
		{
			return this.frame;
		}
		
		public function set faceDir(dir:int):void
		{
			this.frame = dir;
		}
		
	}

}