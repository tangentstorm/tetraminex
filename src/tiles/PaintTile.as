package tiles 
{
	import sprites.Block;
	import sprites.GridSprite;
	/**
	 * ...
	 * @author Michal J Wallace
	 */
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