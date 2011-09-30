package rooms 
{
	import scripts.*;

	public class Room0 extends RoomScript 
	{	
		
		override public function roomStarted(room:Room):void 
		{
			Script.begin
			
			.teddy
			(
				"Ernie Goldsmile! Welcome to Tetraminex!\n\n" +
				
				"I'm Teddy Tetraminus, and I run the company.\n\n" +
				
				"Step over here with your your arrow keys \n" +
				"and we can get your training started!\n"
			)
		}		
	}
}