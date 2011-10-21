package com.tetraminex.e00
{
	import org.flixel.*;
	import com.tetraminex.core.*;
	import com.tetraminex.core.scripts.*;

	public class EndState extends FlxState
	{
		private var canReplayYet:Boolean = false;
		
		override public function create():void
		{
			var t:FlxText;
			t = new FlxText(0, FlxG.height / 2 - 10, FlxG.width, "To Be Continued.");
			t.font = Assets.talkFont;
			t.size = 32;
			t.alignment = "center";
			add(t);
			
			
			Script.begin
			.wait(3)
			.thunk(function():void
			{
				t = new FlxText(0, FlxG.height-32, FlxG.width, "[ press enter to replay ]");
				t.alignment = "center";
				t.size = 17;
				t.color = 0xff999999;
				t.font = Assets.talkFont;
				add(t);
				canReplayYet = true;
			});
		}


		override public function update():void
		{
			super.update();
			ScriptManager.instance.update();
			
			if (canReplayYet)
			{
				if (FlxG.keys.justPressed("ENTER"))
				{
					PlayState.levelNum = 0;
					FlxG.switchState(new MenuState());
				}
			}
		}
	}

}

