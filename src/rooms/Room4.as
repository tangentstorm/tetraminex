package rooms 
{
	import scripts.*;

	public class Room4 extends RoomScript 
	{
		override public function roomStarted(room:Room):void 
		{
			Script.begin
			.teddy
			(
				"Color is a very important part of this business.\n\n" +
				
				"Sometimes the blocks we start with aren't the\n" +
				"right color, but that's easy enough to fix.\n\n" +
				
				"Drag these blocks through the paint squares to\n" +
				"change their colors.\n\n"
			);
		}
		
		override public function roomSolved(room:Room):void 
		{
			Script.begin
			.teddy
			(
				"Perfect!\n\n" +
				
				"That's pretty much all there is to it.\n\n" +
				
				"Let's get the final exam out of the way so\n" +
				"you can start your new career!\n"
			);
		}

	}
}