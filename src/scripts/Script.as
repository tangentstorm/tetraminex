package scripts 
{
	import org.flixel.*;
	
	public class Script
	{
		public static const begin:Script = new Script();
		
		public function teddy(text:String, angle:Number=0):Script
		{
			ScriptManager.push(new TalkScript('teddy', text, angle));
			return this;
		}
		
		public function ernie(text:String, angle:Number=0):Script 
		{
			ScriptManager.push(new TalkScript('ernie', text, angle));
			return this;
		}
		
		public function ivan(text:String, angle:Number=0):Script
		{
			ScriptManager.push(new TalkScript('ivan', text, angle));
			return this;
		}
		
		public function thunk(thunk:Function):Script
		{
			ScriptManager.push(new ThunkScript(thunk));
			return this;
		}
		
		public function wait(seconds:Number):Script
		{
			ScriptManager.push(new WaitScript(seconds));
			return this;
		}
		
		public function beat():Script
		{
			return this.wait(0.25);
		}
		
		public function fadeOut():Script
		{
			ScriptManager.push(new FadeToBlackScript(false));
			return this;
		}
		
		public function fadeIn():Script
		{
			ScriptManager.push(new FadeToBlackScript(true));
			return this;
		}
		
		public function setattr(obj:Object, slot:String, value:Object):Script
		{
			return this.thunk(function():void {  obj[slot] = value; } );
		}
		
		public function shake(intensity:Number, duration:Number):Script
		{
			return thunk(function():void { FlxG.shake(intensity, duration); } );
		}
		
		public function lock():Script
		{
			return this.setattr(ScriptManager.instance, "locked", true);
		}
		public function unlock():Script
		{
			return this.setattr(ScriptManager.instance, "locked", false);
		}
		
		public function toBeContinued():Script
		{
			return Script.begin
			.fadeOut()
			.beat()
			.beat()
			.thunk(function():void 
			{ 
				// TODO: Talkwindow should clean itself up so this isn't required:
				(FlxG.state as PlayState).remove(TalkWindow.instance);
				FlxG.switchState(new EndState()); 
			});
		}
		
	}

}