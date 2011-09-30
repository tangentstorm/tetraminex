package scripts 
{

	public class Room1 extends RoomScript 
	{
		override public function roomStarted(room:Room):void 
		{
			super.roomStarted(room);
			room.talkWindow.teddy
			(
				"Let's start with the basics. Tetraminex makes\n" +
				"tetraminos for video games around the world.\n\n" +
				
				"Your job is to put them together. So try it!\n\n" +
				
				"Push these blocks into the matching cages with\n" +
				"your arrow keys."
			);
		}
		
		override public function roomSolved(room:Room):void 
		{
			room.talkWindow.teddy
			(
				"Excellent work! I knew hiring you was a smart\n" +
				"choice.\n\n" +
				"Right this way, and we'll move on to something\n" +
				"more interesting."
			);
		}
		
	}
}