package scripts 
{
	public class ThunkScript implements IScript 
	{
		
		private var mThunk:Function;
		
		public function ThunkScript(thunk:Function) 
		{
			mThunk = thunk;
		}
		
		/* INTERFACE scripts.IScript */
		
		public function begin():void 
		{
			mThunk();
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