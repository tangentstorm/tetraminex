package com.tetraminex.e00
{
	import org.flixel.system.FlxPreloader;

	public class Preloader extends FlxPreloader
	{
		public function Preloader()
		{
			className = "com.tetraminex.e00.TetraminexE00";
			myURL = "http://tetraminex.com/episode/00";
			super();
		}
	}

}
