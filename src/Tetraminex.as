package
{
	import org.flixel.*;
	
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass = "Preloader")]
	public class Tetraminex extends FlxGame
	{
		public static var frames:Object = 
		{
			red : 1,
			green: 2
		};
		
		
		[Embed("assets/images/billboard.png")]
		public static var ImgBillboard:Class;

		[Embed("assets/images/blocks.png")]
		public static var ImgBlock:Class;
		
		[Embed("assets/images/door.png")]
		public static var ImgDoor:Class;		
		
		[Embed("assets/images/empty.png")]
		public static var ImgEmpty:Class;

		[Embed("assets/images/hands.png")]
		public static var ImgHands:Class;
		
		[Embed("assets/images/hero.png")]
		public static var ImgHero:Class;
		
		[Embed("assets/images/Ivan.png")]
		public static var ImgIvan:Class;
		
		[Embed("assets/images/MrT.png")]
		public static var ImgMrT:Class;
		
		
		public function Tetraminex()
		{
			//super(640, 480, MenuState, 1);
			super(640, 480, PlayState, 1);
		}
	}

}
