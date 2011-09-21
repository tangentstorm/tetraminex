package sprites 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Hero extends GridSprite
	{	
		public var grabbers:Array;
		public var grabberGroup:FlxGroup = new FlxGroup();
		
		public function Hero(x:Number=0, y:Number=0) 
		{
			super(x, y);
			loadGraphic(Tetraminex.ImgHero, true);
			
			grabbers = Grabber.makeGrabbers(this, grabberGroup);
			
			addAnimation('D', [0]);
			addAnimation('R', [1]);
			addAnimation('L', [2]);
			addAnimation('U', [3]);
			
			play('D');
		}
		
		
		override public function canMove(dir:FlxPoint):Boolean 
		{
			var neighbor:GridSprite = grid.neighbor(this, dir);
			for (var i:int = 0; i < 4; ++i)
			{
				var g:Grabber = grabbers[i];
				if (!g.canMove(dir))
				{
					return false;
				}
			}
			return (neighbor.solid) ? neighbor.canMove(dir) : true;
		}
		
	}

}