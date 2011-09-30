package rooms 
{
	import scripts.*;

	public class Room6 extends RoomScript 
	{
		override public function roomStarted(room:Room):void 
		{
			room.teddy.angle = 150;
			
			Script.begin
			.teddy
			(
				"Unnnnnnnghh... My poor head.\n\n" +
				"Are you okay, Ernie?\n\n",
				room.teddy.angle
			)
			
			.wait(5)
			
			.thunk(function ():void 
			{
				room.teddy.angle = 0;
			})
			
		}
	}
}