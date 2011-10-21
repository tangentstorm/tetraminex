package com.tetraminex.core.sprites 
{
	import org.flixel.*;
	import com.tetraminex.core.*;
	

	public class Wall extends GridSprite
	{
		
		public function Wall(x:Number=0, y:Number=0) 
		{
			super(x, y);
			makeGraphic(Room.kCellH, Room.kCellW, 0x99666666);
			solid = true;
			visible = false;
			immovable = true;
			moves = false;
		}
		
	}

}