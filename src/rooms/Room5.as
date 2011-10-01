package rooms 
{
	import flash.errors.ScriptTimeoutError;
	import scripts.*;
	import org.flixel.*;
	
	public class Room5 extends RoomScript 
	{
		override public function roomStarted(room:Room):void 
		{
			Script.begin
			.teddy
			(
				"Okay, Ernie! Time to see what you've learned.\n\n" +
				
				"Solve this room and your training is complete.\n\n" +
				
				"Remember, you can press R if you get stuck."
			);
		}
		
		
		override public function cageSolved(room:Room, numLeft:int):void 
		{
			super.cageSolved(room, numLeft);
			
			var script:Script = Script.begin;
			
			if (numLeft % 7 == 0)
			{
				var phase:int = Math.floor(numLeft / 7);
				var scale:Number = (4 - phase) / 4;
				var duration:Number = phase == 0 ? 5 : scale;
				
				script.thunk(function():void
				{
					FlxG.shake(0.05 * scale, duration);
				})
				.beat()				
				.beat();
				
				switch (phase)
				{
					case 3: script.teddy("Did you feel that?!"); break;
					case 2: script.teddy("Uh oh.\n\nWe might have a problem.\n\nYou'd better work fast."); break;
					case 1: script.teddy("Hurry, Ernie!\n\n We have to get out of here!"); break;
					case 0: 
						script
						.fadeOut()
						.thunk(function():void { (FlxG.state as PlayState).loadLevel(6); } )
					default:
				}			
			}	
		}
	}
}