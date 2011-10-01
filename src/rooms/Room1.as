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
				"Let's start with the basics. Tetraminex makes\n" +
				"tetraminos for video games around the world.\n\n" +
				
				"Your job will be to assemble them. Let's try it!\n\n" +
				
				"Use your arrow keys to push these blocks into\n" +
				"the matching cages.\n\n"
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