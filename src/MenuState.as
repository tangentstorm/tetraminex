package
{
	import org.flixel.*;


	public class MenuState extends FlxState
	{
		override public function create():void
		{
			var t:FlxText;
			t = new FlxText(0, FlxG.height / 2 - 10, FlxG.width, "Tetraminex: Episode 00");
			t.font = Assets.talkFont;
			t.size = 32;
			t.alignment = "center";
			add(t);
			
			t = new FlxText(0, FlxG.height-32, FlxG.width, "[ click here, then press enter to play ]");
			t.alignment = "center";
			t.size = 17;
			t.color = 0xff999999;
			t.font = Assets.talkFont;
			add(t);
		}


		override public function update():void
		{
			super.update();
			if (FlxG.keys.justPressed("ENTER"))
			{
				FlxG.switchState(new PlayState());
			}
		}
	}

}

