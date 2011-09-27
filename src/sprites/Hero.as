package sprites 
{
	import flash.display.GradientType;
	import flash.text.GridFitType;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Hero extends GridSprite
	{	
		public var grabbers:Array;
		public var grabberGroup:FlxGroup = new FlxGroup();
		public var grabCount:int = 0;
		public var handCount:int = 2;
		public var dgy:int = 0;
		
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
			
			// can't hold the floor and move if there's gravity
			// TODO: lift floor if also holding a conveyor belt, etc.
			if (room.gravity && holding(room.neighbor(this, Room.pointS)))
			{
				return false;
			}
			
			// can't move if grabbing something that can't move in that dir
			var neighbor:GridSprite = room.neighbor(this, dir);
			for (var i:int = 0; i < 4; ++i)
			{
				var g:Grabber = grabbers[i];
				if (!g.canMove(dir))
				{
					return false;
				}
			}
			
			// otherwise, we can move as long as we can push anything in our way
			return (neighbor.solid) ? neighbor.canMove(dir) : true;
		}
		
		override public function moved():void 
		{
			super.moved();
			// always follow the owner, possibly dragging something along:
			grabberGroup.callAll("reposition");
		}
		
		public function holding(gs:GridSprite):Boolean
		{
			if (gs == null || gs is NullSprite)
				return false;
				
			for (var i:int = 0; i < grabbers.length; ++i)
			{
				if (grabbers[i].content == gs) return true; 
			}
			return false;
		}
		
		public function jump():void 
		{
			var floor:GridSprite = room.get(gx, gy + 1);
			var roof:GridSprite  = room.get(gx, gy - 1);
			if (floor.solid && ! roof.solid && ! holding(floor))
			{
				// upward momentum so we can jump onto platforms
				dgy = 1;
				room.nudge(this, Room.pointN);
			}
		}
		
		
	}

}