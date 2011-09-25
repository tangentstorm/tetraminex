package
{
	import levels.*;
	import org.flixel.*;
	import sprites.*;

	public class PlayState extends FlxState
	{
		private const kCellSize:int = 30;
		private var mTickCounter:Number = 0;
		private var mHero:Hero;
		private var mBlocks:FlxGroup = new FlxGroup();
		private var mRoom:Room = new Room();
		
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
			
			mRoom.addWalls(level['layerWalls']);
			mRoom.addTiles(level['layerTiles']);
			mRoom.doneBuilding();			
			mRoom.onHeroExit(function():void
			{
				loadLevel((levelNum + 1) % 10);
			});
		}
		
		
		public function loadLevel(num:int):void
		{
			levelNum = num;
			FlxG.resetState();
		}
		
		
		
		private const kNumKeys:Array = [
			"ZERO", "ONE", "TWO", "THREE", "FOUR", 
			"FIVE", "SIX", "SEVEN", "EIGHT", "NINE"];
		
		override public function update():void
		{
			super.update();
			mHero.acceleration.x = 0;
			mHero.acceleration.y = 0;
			
			
            updateGrabbers();
			
			// until we have a level select screen:
			for (var n:int = 0; n < 10; ++n)
			{
				if (FlxG.keys.justPressed(kNumKeys[n]))
				{
					loadLevel(n);
					return;
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
			else if (FlxG.keys.justPressed("UP"))
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
					mRoom.nudge(mHero, Room.pointN);
				}
				else if (FlxG.keys.DOWN)
				{
					mRoom.nudge(mHero, Room.pointS);
				}
			}
			
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
		
		private function drawGrid():void 
		{
			// draw the grid
			for (var x:int = 0; x < 16; ++x)
			{
				for (var y:int = 0; y < 16; ++y)
				{
					add(new sprites.Empty(x * kCellSize, y * kCellSize));
				}
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
				
				if (mGrabKeys[dir])
				{
					g.exists = true;
					g.done = false;
					
					// grab something new:
					if (! mGrabLast[dir])
					{
						g.grab();
					}
				}
				else
				{
					g.exists = false;
					g.release();
				}
				mGrabLast[dir] = mGrabKeys[dir];
			}
		}
		
	}
}
