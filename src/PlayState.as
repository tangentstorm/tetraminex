package
{
	import flash.utils.getQualifiedClassName;
	import levels.*;
	import org.flixel.*;
	import rooms.*;
	import sprites.*;

	public class PlayState extends FlxState
	{
		private const kCellSize:int = 30;
		private var mTickCounter:Number = 0;
		private var mHero:Hero;
		private var mBlocks:FlxGroup = new FlxGroup();
		private var mRoom:Room = new Room();
		
		private var mTalkWindow:TalkWindow = new TalkWindow();
		
		
        private var mGrabKeys:Array = [false, false, false, false];
        private var mGrabLast:Array = [false, false, false, false];
		
		
		public static var levelNum:int = 0;
		
		override public function create():void
		{
			var level:BaseLevel;
			switch (levelNum)
			{
				case 0 : level = new Level_Room0(true, onAddObject); break;
				case 1 : level = new Level_Room1(true, onAddObject); break;
				case 2 : level = new Level_Room2(true, onAddObject); break;
				case 3 : level = new Level_Room3(true, onAddObject); break;
				case 4 : level = new Level_Room4(true, onAddObject); break;
				case 5 : level = new Level_Room5(true, onAddObject); break;
				case 6 : level = new Level_Room6(true, onAddObject); break;
				case 7 : level = new Level_Room7(true, onAddObject); break;
				case 8 : level = new Level_Room8(true, onAddObject); break;
				case 9 : level = new Level_Room9(true, onAddObject); break;
			}
			
			// add sprites:
			
			this.add(mHero.grabberGroup);
			
			mRoom.gravity = level['gravity'];
			mRoom.addWalls(level['layerWalls']);
			mRoom.addTiles(level['layerTiles']);
			mRoom.script = RoomScript.forLevel(levelNum);
			mRoom.talkWindow = mTalkWindow;
			mRoom.doneBuilding();
			mRoom.onHeroExit(function():void
			{
				loadLevel((levelNum + 1) % 10);
			});
			
			// gui stuff:
			
			var hud:FlxSprite = this.add(new FlxSprite(480, 0)) as FlxSprite;
			hud.makeGraphic(640 - 480, 480, 0xff999999);
			var shadow:FlxSprite = this.add(new FlxSprite(480, 0)) as FlxSprite;
			shadow.makeGraphic(15, 480, 0xff666666);
			
			var txt:FlxText = this.add(new FlxText(510, 30, 640 - 480, 
				"TETRAMINEX:\nEpisode 00\n\n" +
				"BY:\nMichal J Wallace\n\n" + 
				"STARRING:\n" + 
				"Ernie Goldsmile\n" + 
				"Teddy Tetraminus\n\n" + 
				"AND INTRODUCING:\n" +
				"Oscar Cyanovich\n" + 
				"as Ivan Barr\n"
			)) as FlxText;
			txt.font = Assets.talkFont;
			txt.size = 14;
			
			this.add(mTalkWindow);
			
		}
		
		
		public function loadLevel(num:int):void
		{
			levelNum = num;
			FlxG.resetState();
		}
		
		
		
		private const kNumKeys:Array = [
			"ZERO", "ONE", "TWO", "THREE", "FOUR", 
			"FIVE", "SIX", "SEVEN", "EIGHT", "NINE"];
			
		private var mJustJumped:Boolean = false;
			
		override public function update():void
		{
			super.update();
			mHero.acceleration.x = 0;
			mHero.acceleration.y = 0;
			
			if (mTalkWindow.visible)
			{
				return;
			}
			
			
			CONFIG::debug
			{
				// until we have a level select screen:
				for (var n:int = 0; n < 10; ++n)
				{
					if (FlxG.keys.justPressed(kNumKeys[n]))
					{
						loadLevel(n);
						return;
					}
				}
				
				if (FlxG.keys.justPressed("C"))
				{
					mRoom.cageFilled();
				}
				
				if (FlxG.keys.justPressed("X"))
				{
					mRoom.roomSolved();
				}				
			}
			
			if (FlxG.keys.justPressed("RIGHT"))
			{
				mHero.play('R');
			}
			else if (FlxG.keys.justPressed("LEFT"))
			{
				mHero.play('L');
			}
			else if (FlxG.keys.justPressed("UP") && ! mRoom.gravity)
			{
				mHero.play('U');
			}
			else if (FlxG.keys.justPressed("DOWN"))
			{
				mHero.play('D');
			}
			
			else if (FlxG.keys.justPressed("R"))
			{
				FlxG.resetState();
			}
			
			else if (FlxG.keys.justPressed("F"))
			{
				FlxG.log('floor=' + getQualifiedClassName(mRoom.neighbor(mHero, Room.pointS)));			
			}
			else if (FlxG.keys.justPressed("H"))
			{
				FlxG.log('@hero=' + getQualifiedClassName(mRoom.get(mHero.gx, mHero.gy)));
			}
			
			
			if (! FlxG.keys.UP) { mJustJumped = false; }
			
			mTickCounter += FlxG.elapsed;
			if (mTickCounter > 0.10)
			{
				mTickCounter = 0;
				
				if (FlxG.keys.RIGHT)
				{
					mRoom.nudge(mHero, Room.pointE);					
				}
				else if (FlxG.keys.LEFT)
				{
					mRoom.nudge(mHero, Room.pointW);
				}
				else if (FlxG.keys.UP)
				{
					if (mRoom.gravity)
					{
						if (!mJustJumped) { mHero.jump(); }
						mJustJumped = true;
					}
					else
						mRoom.nudge(mHero, Room.pointN);
				}
				else if (FlxG.keys.DOWN)
				{
					mRoom.nudge(mHero, Room.pointS);
				}
					
				mRoom.tick();
			}
			
			// update grabbers after mRoom.tick so we can't jump and grab 2 squares high
			updateGrabbers();			
			
		}
		
		private function onAddObject(obj:Object, group:FlxGroup, 
				level:BaseLevel, scrollX:Number, scrollY:Number, properties:Array):void
		{
			
			
            var color:String = null;
			var isVertical:Boolean = false;
            if ( properties )
            {
                var i:uint = properties.length;
                while(i--)
                {
                    var name:String = properties[i].name;
                    var value:Object = properties[i].value;
					switch (name) 
					{
						
					case 'color':
						color = value as String;
						break;
					
					case 'isVertical':
						isVertical = value as Boolean;
						break;
						
					default:
					}
                }
            }
			
			
			if (obj is Hero)
			{
				mHero = obj as Hero;
				mRoom.addSprite(mHero);
			}
			else if (obj is Block)
			{
				var block:Block = obj as Block;
				block.setColorByName(color);
				mBlocks.add(block);
				mRoom.addSprite(block);
			}
			else if (obj is Door)
			{
				var door:Door = obj as Door;
				door.play(isVertical ? 'vertical' : 'horizontal');
				mRoom.addSprite(door);
			}
			else if (obj is GridSprite)
			{
				mRoom.addSprite(obj as GridSprite);
			}
		}
		
		private function updateGrabbers():void 
		{
			// wasd or dvorak equivalents:
			mGrabKeys[Room.N] = FlxG.keys.W || FlxG.keys.COMMA;
			mGrabKeys[Room.W] = FlxG.keys.A;
			mGrabKeys[Room.S] = FlxG.keys.S || FlxG.keys.O
			mGrabKeys[Room.E] = FlxG.keys.D || FlxG.keys.E; // || screenshotcheat
			
            var g:Grabber;
            for (var dir:int = 0; dir < 4; ++dir)
            {
				g = mHero.grabbers[dir];
				
				// !! we don't reposition on every tick because it would retrigger GridTile.onPut()
				
				if (mGrabKeys[dir] && ! mGrabLast[dir])
				{
					if (mHero.grabCount < mHero.handCount)
					{
						g.exists = true;
						g.done = false;
						g.grab();
					}
					mHero.grabCount++;
				}
				else if (mGrabLast[dir] && ! mGrabKeys[dir])
				{
					g.exists = false;
					g.release();
					mHero.grabCount--;
				}
				mGrabLast[dir] = mGrabKeys[dir];
			}
		}
		
	}
}
