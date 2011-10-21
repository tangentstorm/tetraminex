package com.tetraminex.core.tiles 
{
	import com.tetraminex.core.*;
	import com.tetraminex.core.sprites.*;
	
	public class ExitTile extends GridTile 
	{
		public var door:Door;
		private var mOpen:Boolean;
		
		public function ExitTile() 
		{
			super();
		}
		
		public function open():void 
		{
			mOpen = true;
			if (door)
			{
				door.open();
			}
		}
		
		override public function onPut(sprite:GridSprite, room:Room):void 
		{
			if (mOpen && sprite is Hero)
			{
				room.heroExit();
			}
		}
		
	}

}