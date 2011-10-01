package rooms 
{
	import scripts.*;

	public class Room1 extends RoomScript 
	{
		override public function roomStarted(room:Room):void 
		{
			Script.begin
			.teddy
			(
				"Okay Ernie. Let's start with the basics:\n\n" +
				
				"At Tetraminex, we makes tetraminos.\n" +				
				"Your job is to assemble them.\n\n" +
				
				"Try it now! Use your arrow keys to push these\n" +
				"blocks into their matching cages.\n\n"
			);
		}
		
		
		override public function cageSolved(room:Room, numLeft:int):void 
		{
			if (numLeft == 3)
			{
				Script.begin
				.beat()
				.teddy("Exactly!\n\nGo ahead and do the others.");
			}
		}
		
		override public function roomSolved(room:Room):void 
		{
			Script.begin
			.beat()
			
			.teddy
			(
				"Excellent work! I knew hiring you was a smart\n" +
				"choice.\n\n" +
				"Right this way, and we'll move on to something\n" +
				"more interesting."
			);
		}
		
	}
}