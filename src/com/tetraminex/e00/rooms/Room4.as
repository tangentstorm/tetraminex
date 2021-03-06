package com.tetraminex.e00.rooms 
{
	import com.tetraminex.core.scripts.*;
	import com.tetraminex.core.*;

	public class Room4 extends RoomScript 
	{
		override public function roomStarted(room:Room):void 
		{
			Script.begin
			.teddy
			(
				"Color plays a very important role in the\n" +
				"tetramino industry.\n\n" +
				
				"Sometimes blocks are the wrong color, but it's\n" +
				"nothing a little paint can't fix.\n\n" +
				
				"Drag these blocks through the white-edged tiles\n" +
				"to repaint them.\n\n"
			);
		}
		
		override public function roomSolved(room:Room):void 
		{
			Script.begin
			.beat()
			
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