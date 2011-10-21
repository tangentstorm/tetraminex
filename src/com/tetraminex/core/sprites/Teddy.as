package com.tetraminex.core.sprites 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Teddy extends Avatar 
	{
		
		public function Teddy(x:Number=0, y:Number=0) 
		{
			super(x, y);
			loadGraphic(Assets.ImgTeddy, true, false);
			immovable = true;
		}
		
	}

}