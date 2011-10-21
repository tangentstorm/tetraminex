package com.tetraminex.core.sprites 
{
	import org.flixel.*;
	import com.tetraminex.core.*;
	
	
	public class Avatar extends GridSprite 
	{
		public var dgy:int = 0;
		
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
		
		public function jump():void
		{
			this.dgy = 1;
			room.nudge(this, Room.pointN);
		}
		
	}

}