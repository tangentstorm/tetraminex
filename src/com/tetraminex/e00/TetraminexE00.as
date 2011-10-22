package com.tetraminex.e00
{
	import flash.display.*;
	import flash.text.*;
	import org.flixel.*;
	import com.tetraminex.core.*;
	import flash.ui.Mouse;
	import org.gamesketchlib.data.*;
	
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass = "com.tetraminex.e00.Preloader")]
	public class TetraminexE00 extends FlxGame
	{
		public function TetraminexE00()
		{
			// GsStash.clear();
			PlayState.levelLocker = new GsLevelLocker("e00");
			PlayState.levelLocker.unlock(0);
			
			CONFIG::release
			{
				super(640, 480, MenuState, 1);
			}
			CONFIG::debug
			{
				PlayState.levelNum = 0;// 6;
				super(640, 480, PlayState, 1);
			}
			
			// FlxG.mouse.show();
			this.useSoundHotKeys = false;
			this.useSystemCursor = true;
			flash.ui.Mouse.show();
		}
		
		override protected function createFocusScreen():void 
		{
			var g:Graphics = _focus.graphics;
			g.lineStyle(5, 0x99ffffff);
			g.beginFill(0x000000, 0.75);
			g.drawRoundRect(10, 10, 640 - 20, 480 - 20, 5);
			g.endFill();
			
			var t:TextField = new TextField();
			t.text = "click to refocus";
			t.setTextFormat(new TextFormat(Assets.talkFont, 24, 0xffffff));
			t.embedFonts = true;
			t.x = (stage.width - t.width) /2;
			t.y = (stage.height - t.height) / 2;
			t.autoSize = TextFieldAutoSize.CENTER;
			
			_focus.addChild(t);
			addChild(_focus);
		}
	}

}
