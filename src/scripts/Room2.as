package scripts 
{

	public class Room2 extends RoomScript 
	{
		
		override public function roomStarted(room:Room):void 
		{
			super.roomStarted(room);
			room.talkWindow.teddy
			(
				"Anyone can push a block, but at Tetraminex,\n" +
				"we do so much more...\n\n" +
				
				"That's right... We PULL blocks, too!\n\n" +
				
				"Use your [WASD] or [,AOE] keys to grab these\n" +
				"blocks and drag them into place."
			);
		}

		override public function roomSolved(room:Room):void 
		{
			room.talkWindow.teddy
			(
				"Ernie, you're a natural!\n\n" +
				"Right this way for lesson three."
			);
		}

	}
}