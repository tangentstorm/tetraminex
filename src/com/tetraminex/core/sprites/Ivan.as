package com.tetraminex.core.sprites 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Ivan extends Avatar 
	{
		
		public function Ivan(x:Number, y:Number) 
		{
			super(x, y);
			loadGraphic(Assets.ImgIvan, true, false);
			immovable = true;
		}
		
	}

}