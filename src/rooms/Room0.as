package rooms 
{
	import scripts.*;

	public class Room0 extends RoomScript 
	{	
		
		override public function roomStarted(room:Room):void 
		{
			room.teddy.visible = false;
			room.teddy.faceDir = Room.W;
			
			Script.begin
			.ivan
			(
				"Hold it right there, fellow. This is a secure area.\n\n" +
				"Do you have an appointment?\n\n"
			)
			
			.ernie
			(
				"Oh, hi there. I'm Ernie Goldsmile.\n\n" +
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
				
				"Don't mind Ivan. It's his job to keep things\n" +
				"orderly around here.\n\n" +
				
				"I'm Teddy Tetraminus, CEO of Tetraminex."
			)
			
			.teddy
			(
				"I like to train the summer hires myself.\n\n" +
				
				"Step over here with your your arrow keys \n" +
				"and I'll show you what we do around here!\n"
			)
			
			.ivan
			(
				"Hrmph...\n\n" +
				"Don't forget to get the kid a badge.\n\n"
			);
			
		}
	}
}