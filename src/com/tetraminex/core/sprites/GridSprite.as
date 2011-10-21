package com.tetraminex.core.sprites 
{
	import org.flixel.*;
	import com.tetraminex.core.*;
	
	public class GridSprite extends FlxSprite 
	{
		
		public var gx:int;
		public var gy:int;
		public var room:Room;
		public var held:Boolean;
		
		public function GridSprite(x:Number = 0, y:Number = 0)
		{
			super(x, y);
		}
		
		public function canMove(dir:FlxPoint):Boolean
		{		
			if (immovable) return false;
			if (room.neighbor(this, dir).solid) return false;
			return true;
		}
		
		public function moved():void 
		{
			
		}
			
	}

}