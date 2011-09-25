package tiles 
{
	import sprites.*;
	
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class GridTile 
	{
		
		public static const nullTile:GridTile = new GridTile();
		
		public function GridTile() 
		{
			
		}
		
		public static function fromMap(code:int):GridTile
		{
			if (code > 0 && code < 5)
			{
				return new ExitTile();
			}
			else if (code >= 8 && code < 16)
			{
				return new PaintTile(code - 8);
			}
			else if (code >= 16 && code < 32)
			{
				return new CageTile(code - 16);
			}
			else switch (code)
			{
				default:
					return nullTile;
			}
			return nullTile; // not sure why the compiler complains here... ??
		}
		
		public function onPut(sprite:GridSprite, room:Room):void
		{
			
		}
		
	}

}