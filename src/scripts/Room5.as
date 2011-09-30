package scripts 
{
	import org.flixel.*;
	
	public class Room5 extends RoomScript 
	{
		override public function roomStarted(room:Room):void 
		{
			super.roomStarted(room);
			room.talkWindow.teddy
			(
				"Okay, Ernie! Time to see what you've learned.\n\n" +
				
				"Solve this room and your training is complete.\n\n" +
				
				"Remember, you can press R if you get stuck."
			);
		}
		
		
		override public function cageSolved(room:Room, numLeft:int):void 
		{
			super.cageSolved(room, numLeft);
			
			if (numLeft % 7 == 0)
			{
				var phase:int = Math.floor(numLeft / 7);
				var scale:Number = (4 - phase) / 4;
				
				FlxG.shake(0.05 * scale, scale);
				
				switch (phase)
				{
					case 3: room.talkWindow.teddy("Did you feel that?!"); break;
					case 2: room.talkWindow.teddy("Uh-oh."); break;
					case 1: room.talkWindow.teddy("Hurry, Ernie!\n\n We have to get out of here!"); break;
					case 0: (FlxG.state as PlayState).loadLevel(6);
					default:
				}			
			}
			
		}
		
		
		override public function roomSolved(room:Room):void 
		{
			super.roomSolved(room);
		}
		
	}
}