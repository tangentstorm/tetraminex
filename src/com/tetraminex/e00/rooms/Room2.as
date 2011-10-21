package com.tetraminex.e00.rooms 
{
	import com.tetraminex.core.scripts.*;
	import com.tetraminex.core.*;
	
	public class Room2 extends RoomScript 
	{
		
		override public function roomStarted(room:Room):void 
		{
			Script.begin
			.teddy
			(
				"Anyone can push blocks around, Ernie, but\n" +
				"at Tetraminex, we do more than push blocks!\n\n" +
				
				"That's right! We PULL them too!\n\n" +
				
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