package com.tetraminex.core.tiles 
{
	import com.tetraminex.core.*;
	import com.tetraminex.core.sprites.*;
	
	public class PaintTile extends GridTile
	{
		
		private var mColor:int;
		
		
		public function PaintTile(color:int) 
		{
			super();
			mColor = color;
		}
		
		override public function onPut(sprite:GridSprite, room:Room):void
		{
			if (sprite is Block)
			{				
				var block:Block = sprite as Block;
				block.setColor(mColor);
			}
		}
		
	}

}