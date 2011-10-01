package scripts 
{
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class NullScript implements IScript 
	{
		
		public static const instance:NullScript = new NullScript();
		
		public function NullScript() 
		{
			
		}
		
		/* INTERFACE scripts.IScript */
		
		public function begin():void 
		{
			
		}
		
		public function onFrame():void 
		{
			
		}
		
		public function onTick():void 
		{
			
		}
		
		public function isFinished():Boolean 
		{
			return true;
		}
		
		public function isModal():Boolean 
		{
			return false;
		}
		
	}

}