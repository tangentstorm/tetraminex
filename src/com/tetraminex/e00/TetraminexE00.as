package com.tetraminex.e00
{
	import org.flixel.*;
	import com.tetraminex.core.*;
	
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass = "com.tetraminex.e00.Preloader")]
	public class TetraminexE00 extends FlxGame
	{
		public function TetraminexE00()
		{
			CONFIG::release
			{
				super(640, 480, MenuState, 1);
			}
			CONFIG::debug
			{
				PlayState.levelNum = 0;// 6;
				super(640, 480, PlayState, 1);
			}
		}
	}

}
