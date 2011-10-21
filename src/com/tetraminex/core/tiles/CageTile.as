package com.tetraminex.core.tiles 
{
	import com.tetraminex.core.*;
	import com.tetraminex.core.sprites.*;
	
	public class CageTile extends GridTile
	{
		
		private var mColor:int;
		
		
		public function CageTile(color:int) 
		{
			super();
			mColor = color;
		}
		
		override public function onPut(sprite:GridSprite, room:Room):void
		{
			if (sprite is Block)
			{				
				var block:Block = sprite as Block;
				if (block.getColor() == mColor)
				{
					block.lock();
					room.cageFilled();
				}
			}
		}
		
	}

}