package rooms 
{
	import scripts.*;
	import org.flixel.*;

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
					room.nudge(room.teddy, dir);
				};
			}
			
			
			Script.begin
			.lock()
			.shake(0.05, 2)
			.fadeIn()
			
			.shake(0.04, 0.5)
			.wait(2)
			.setattr(room, "gravity", true)
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
				"I... Uh... I think so.\n",
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
			
			// climb the stairs
			
			.setattr(room.teddy, "faceDir", Room.W)
			.thunk(makeNudgeTeddy(Room.pointW))
			
			.thunk(makeNudgeTeddy(Room.pointN))
			.thunk(makeNudgeTeddy(Room.pointW))
			.wait(0.35)
			
			.thunk(makeNudgeTeddy(Room.pointN))
			.thunk(makeNudgeTeddy(Room.pointW))
			.wait(0.35)
			
			.thunk(makeNudgeTeddy(Room.pointN))
			.thunk(makeNudgeTeddy(Room.pointW))
			.wait(0.35)
			
			.thunk(makeNudgeTeddy(Room.pointN))
			.thunk(makeNudgeTeddy(Room.pointW))
			.wait(0.35)
		}
	}
}