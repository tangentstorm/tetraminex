package com.tetraminex.e00.rooms
{
	import com.tetraminex.core.scripts.*;
	import com.tetraminex.core.*;

	public class Room0 extends RoomScript 
	{	
		
		private var mStepCount:int = 0;
		
		override public function roomStarted(room:Room):void 
		{
			room.teddy.visible = false;
			room.teddy.faceDir = Room.W;
			
			Script.begin
			.wait(5)
			.thunk(function():void {
				if (mStepCount == 0)
				{
					Script.begin
					.ernie
					(
						"What a beautiful day to start my new job!\n\n" +
						
						"I should put my arrow keys to use and go inside.\n"
					);
				}
			});
			
		}
		
		
		override public function stepTaken(room:Room):void 
		{
			if (++mStepCount != 3)
			{
				return;
			}
			
			ScriptManager.abort();
			
			Script.begin
			.ivan
			(
				"Hold it right there, buddy.\n\n" +
				"This is a secure area.\n\n" +
				"Do you have an appointment?\n\n"
			)
			
			.ernie
			(
				"Oh, hello!\n\n" +
				"I'm Ernie Goldsmile.\n\n" +
				"I'm starting my summer job here today.\n\n"
			)
			
			.ivan
			(
				"Goldsmile... Goldsmile...\n\n" + 
				"Sorry kid, you're not on the list.\n\n" +
				"I'm going to have to ask you to lea--"
			)
			
			.beat()
			.thunk(function():void
			{ 
				room.teddy.visible = true;
				room.teddy.immovable = false;
			})
			.beat()
			.thunk(function():void { room.nudge(room.teddy, Room.pointW); })
			.beat()
			.thunk(function():void { room.nudge(room.teddy, Room.pointW); })
			.beat()
			.thunk(function():void {
				room.nudge(room.teddy, Room.pointN);
				room.teddy.immovable = true;
			})
			.beat()
			.setattr(room.teddy, "faceDir", Room.S)
			.beat()
			
			.teddy
			(
				"Ernie Goldsmile! Welcome to Tetraminex!\n\n" +
				
				"Don't mind Ivan. It's his job to impose a\n" +
				"little order on this place. The poor guy!\n\n" +
				
				"I'm Teddy Tetraminus, CEO."
			)
			
			.teddy
			(
				"We're a pretty big company, but not so big\n" +
				"that I don't know everybody by name.\n\n" +
				
				"I still like to train the summer hires myself.\n\n" +
				
				"So... If you'll just step through this door,\n" +
				"I'll show you what it is we do around here!\n"
			)
			
			.ivan
			(
				"Hrmph...\n\n" +
				"Don't forget to get the kid a badge.\n\n"
			);
			
		}
	}
}