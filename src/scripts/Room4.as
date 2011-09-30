package scripts 
{

	public class Room4 extends RoomScript 
	{
		override public function roomStarted(room:Room):void 
		{
			super.roomStarted(room);
			room.talkWindow.teddy
			(
				"Color is a very important part of this business.\n\n" +
				
				"Sometimes the blocks we start with aren't the\n" +
				"right color, but that's easy enough to fix.\n\n" +
				
				"Drag these blocks through the paint squares to\n" +
				"change their colors.\n\n"
			);
		}
	}
}