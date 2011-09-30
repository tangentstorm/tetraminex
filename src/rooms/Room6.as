package rooms 
{
	public class Room6 extends RoomScript 
	{
		override public function roomStarted(room:Room):void 
		{
			room.teddy.angle = 150;
			
			super.roomStarted(room);
			room.talkWindow.teddy
			(
				"Unnnnnnnghh... My poor head.\n\n" +
				"Are you okay, Ernie?\n\n",
				room.teddy.angle
			);
		}
	}
}