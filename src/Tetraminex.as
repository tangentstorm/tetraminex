package
{
	import org.flixel.*;
	
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass = "Preloader")]
	public class Tetraminex extends FlxGame
	{
		public function Tetraminex()
		{
			CONFIG::release
			{
				super(640, 480, MenuState, 1);
			}
			CONFIG::debug
			{
				PlayState.levelNum = 6;
				super(640, 480, PlayState, 1);
			}
		}
	}

}
