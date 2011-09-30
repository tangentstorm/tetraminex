package rooms 
{

	public class Room3 extends RoomScript 
	{
		override public function roomStarted(room:Room):void 
		{
			super.roomStarted(room);
			room.talkWindow.teddy
			(
				"You may have noticed that blocks lock in place\n" +
				"when you move them into a cage.\n\n" +
				
				"Be careful that you don't wall yourself in!\n\n" +
				
				"If you get stuck, press R to restart a room.\n\n"
			);
		}
		
		override public function roomSolved(room:Room):void 
		{
			room.talkWindow.teddy
			(
				"Excellent.\n\n" +
				"Now let's move on to color."
			);
		}
		
	}
}