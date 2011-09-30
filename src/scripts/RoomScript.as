package scripts 
{
	public class RoomScript 
	{
		
		public static function forLevel(levelNum:int):RoomScript
		{
			switch(levelNum)
			{
				case 0: return new Room0();
				case 1: return new Room1();
				case 2: return new Room2();
				case 3: return new Room3();
				case 4: return new Room4();
				case 5: return new Room5();
				case 6: return new Room6();
			default: 
				return new RoomScript(); // ie, this class, that does nothing
			}
		}
		
		public function roomStarted(room:Room):void
		{
			
		}
		
		public function roomSolved(room:Room):void
		{
			
		}
		
		public function cageSolved(room:Room, numLeft:int):void
		{
			
		}
	}
}
