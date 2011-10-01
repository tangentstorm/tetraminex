package rooms 
{
	import scripts.*;
	import org.flixel.*;
	import sprites.Teleporter;

	public class Room6 extends RoomScript 
	{
		
		override public function roomStarted(room:Room):void 
		{
			room.teddy.angle = 150;
			room.ernie.angle = 30;
			room.gravity = false;
			room.teddy.immovable = false; // you can't reach him so no problem
			
			function makeNudgeTeddy(dir:FlxPoint):Function
			{
				return function():void
				{
					if (dir == Room.pointN)
					{
						room.teddy.jump();
					}
					else
					{
						room.nudge(room.teddy, dir);
					}
				};
			}
				
			Script.begin
			.lock()
			.shake(0.05, 2)
			.fadeIn()			
			
			.shake(0.04, 0.5)
			.beat()
			.setattr(room, "gravity", true)
			.wait(2)
			.shake(0.03, 0.2)
			
			.wait(1)
			.shake(0.02, 0.1)
			
			.wait(1.5)
			.teddy
			(
				"Unnnnnnnghh...\n" +
				"               \n" +
				"My poor head...\n\n",
				room.teddy.angle
			)
			
			
			.beat()
			.beat()
			.setattr(room.teddy, "angle", 0)
			.wait(2)
			.setattr(room.teddy, "faceDir", Room.E)
			.beat()
			.beat()
			.thunk(makeNudgeTeddy(Room.pointE))
			.beat()
			.beat()
			.beat()
			.setattr(room.teddy, "faceDir", Room.S)
			.beat()
			.beat()
			.setattr(room.teddy, "faceDir", Room.W)
			.beat()
			.beat()
			.thunk(makeNudgeTeddy(Room.pointW))
			.beat()
			
			.teddy
			(
				"Ernie...?\n\n" +
				"Are you okay?"
			)
			
			.beat()
			.beat()
			.ernie
			(
				"...   ...   ...   ...   ...   ...\n\n" +
				"Unnnnnhhhh.... Was that an earthquake?\n" + 
				"                     \n" +
				"I... Uh...\n" +
				"                     \n" +
				"Yeah... Yeah, I think I can move now.",
				room.ernie.angle
			)
			.beat()
			.beat()
			.setattr(room.ernie, "angle",  0)
			.unlock()
			
			.thunk(makeNudgeTeddy(Room.pointW))
			.beat()
			.setattr(room.teddy, "faceDir", Room.S)
			
			// give player a few seconds to mess around:
			
			.wait(15)
			// .beat().beat()
			
			// climb the stairs
			
			.setattr(room.teddy, "faceDir", Room.W)
			.beat()
			.thunk(makeNudgeTeddy(Room.pointW))
			.beat()
			.thunk(makeNudgeTeddy(Room.pointW))
			.beat()
			
			.thunk(makeNudgeTeddy(Room.pointN))
			.thunk(makeNudgeTeddy(Room.pointW))
			.wait(0.75)
			
			.thunk(makeNudgeTeddy(Room.pointN))
			.thunk(makeNudgeTeddy(Room.pointW))
			.wait(0.75)
			
			.thunk(makeNudgeTeddy(Room.pointN))
			.thunk(makeNudgeTeddy(Room.pointW))
			.wait(0.75)
			
			.thunk(makeNudgeTeddy(Room.pointN))
			.thunk(makeNudgeTeddy(Room.pointW))
			.wait(0.75)
			
			.teddy
			(
				"Ernie... That wasn't an earthquake.\n\n" +
				
				"I'm afraid I've placed you, me, and everyone\n" +
				"we know in terrible, terrible danger.\n\n" + 
				
				"I need you to get back outside at once, and\n" +
				"let Ivan know what happened!\n\n"
			)
			
			.ernie
			(
				"But... I don't know what happened.\n" +
				"                           \n" +
				
				"Plus...\n" +
				"                           \n" +
				
				"Well...\n" +
				"                           \n" +
				
				"I think I'm stuck in this hole."
			)
			
			.teddy
			(
				"Tell Ivan it was the Gravitron Generator.\n" +
				"He'll know what has to be done.\n\n" +
				
				"Now be quick! Grab hold of this device,\n" +
				"and DO NOT let go!\n\n" +
				
				"Hurry, Ernie! The entire town may be at stake!"
			)
			
			.beat()
			.beat()
			
			.thunk(function():void
			{
				var t:Teleporter = new Teleporter(room.teddy.x - Room.kCellW, room.teddy.y);
				var ps:PlayState = FlxG.state as PlayState;
				ps.overlayGroup.add(t.shadow);
				ps.overlayGroup.add(t);
				ps.overlayGroup.add(t.star);
				room.addSprite(t);
			});
			
		}
	}
}