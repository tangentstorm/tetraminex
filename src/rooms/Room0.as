package rooms 
{

	public class Room0 extends RoomScript 
	{	
		
		override public function roomStarted(room:Room):void 
		{
			room.talkWindow.teddy
			(
				"Ernie Goldsmile! Welcome to Tetraminex!\n\n" +
				
				"I'm Teddy Tetraminus, and I run the company.\n\n" +
				
				"Step over here with your your arrow keys \n" +
				"and we can get your training started!\n"
			);
		}
		
	}
}