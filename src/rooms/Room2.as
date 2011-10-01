package rooms 
{
	import scripts.*;
	
	public class Room2 extends RoomScript 
	{
		
		override public function roomStarted(room:Room):void 
		{
			Script.begin
			
			.teddy
			(
				"Anyone can push a block, but at Tetraminex,\n" +
				"we do so much more...\n\n" +
				
				"You see, Ernie... We PULL blocks, too!\n\n" +
				
				"Use your [WASD] or [,AOE] keys to grab these\n" +
				"blocks and drag them into place."
			);
		}
		
		override public function roomSolved(room:Room):void 
		{
			Script.begin
			.beat()
			
			.teddy
			(
				"Ernie, you're a natural!\n\n" +
				"Right this way for lesson three."
			);
		}

	}
}