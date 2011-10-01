package  
{
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Assets 
	{
		
		[Embed("assets/fonts/FranklinGothicDemiCond.ttf", 
			fontName = "franklin gothic",
			embedAsCFF = "false")]
		public static var FontTalk:Class;
		public static const talkFont:String = "franklin gothic";
		
		[Embed("assets/images/talkWindow.png")]
		public static var ImgTalkWindow:Class;
		
		[Embed("assets/images/billboard.png")]
		public static var ImgBillboard:Class;
		
		[Embed("assets/images/blocks.png")]
		public static var ImgBlock:Class;
		
		[Embed("assets/images/door.png")]
		public static var ImgDoor:Class;		
		
		[Embed("assets/images/hands.png")]
		public static var ImgHands:Class;
		
		[Embed("assets/images/hero.png")]
		public static var ImgHero:Class;
		
		[Embed("assets/images/Ivan.png")]
		public static var ImgIvan:Class;
		
		[Embed("assets/images/MrT.png")]
		public static var ImgTeddy:Class;
		
		[Embed("assets/images/Teleporter.png")]
		public static var ImgTeleporter:Class;

		[Embed("assets/images/TeleporterStar.png")]
		public static var ImgTeleporterStar:Class;

		
	}

}