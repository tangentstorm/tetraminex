//Code generated with DAME. http://www.dambots.com

package levels
{
	import org.flixel.*;
	// Custom imports:
import sprites.*;
	public class Level_Room1 extends BaseLevel
	{
		//Embedded media...
		[Embed(source="mapCSV_Room1_Tiles.csv", mimeType="application/octet-stream")] public var CSV_Tiles:Class;
		[Embed(source="../assets/images/tiles.png")] public var Img_Tiles:Class;
		[Embed(source="mapCSV_Room1_Walls.csv", mimeType="application/octet-stream")] public var CSV_Walls:Class;
		[Embed(source="../assets/images/fenceGray.png")] public var Img_Walls:Class;

		//Tilemaps
		public var layerTiles:FlxTilemap;
		public var layerWalls:FlxTilemap;

		//Sprites
		public var SpritesGroup:FlxGroup = new FlxGroup;

		//Shapes
		public var TextGroup:FlxGroup = new FlxGroup;

		//Properties
		public var gravity:Boolean = false;


		public function Level_Room1(addToStage:Boolean = true, onAddCallback:Function = null)
		{
			// Generate maps.
			var properties:Array = [];

			properties = generateProperties( null );
			layerTiles = addTilemap( CSV_Tiles, Img_Tiles, 0.000, 0.000, 30, 30, 1.000, 1.000, false, 1, 1, properties, onAddCallback );
			properties = generateProperties( null );
			layerWalls = addTilemap( CSV_Walls, Img_Walls, 0.000, 0.000, 30, 30, 1.000, 1.000, false, 1, 1, properties, onAddCallback );

			//Add layers to the master group in correct order.
			masterLayer.add(layerTiles);
			masterLayer.add(layerWalls);
			masterLayer.add(SpritesGroup);
			masterLayer.add(TextGroup);

			if ( addToStage )
				createObjects(onAddCallback);

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 480;
			boundsMaxY = 480;
			bgColor = 0xff000000;
		}

		override public function createObjects(onAddCallback:Function = null):void
		{
			addShapesForLayerText(onAddCallback);
			addSpritesForLayerSprites(onAddCallback);
			generateObjectLinks(onAddCallback);
			FlxG.state.add(masterLayer);
		}

		public function addShapesForLayerText(onAddCallback:Function = null):void
		{
			var obj:Object;

			callbackNewData(new TextData(30.000, 390.000, 30.000, 30.000, 0.000, "T: Let's start with the basics. At Tetraminex, we manufacture tetraminos for falling block games all around the world.\r\rT: Your job is to assemble tetraminos from individual blocks. Give it a try! Push these blocks into their holders with your arrow keys.","system", 8, 0xffffff, "center"), onAddCallback, TextGroup, generateProperties( { name:"speaker", value:"MrT" }, null ), 1, 1 ) ;
			callbackNewData(new TextData(420.000, 180.000, 30.000, 30.000, 0.000, "T: Excellent work! I knew hiring you was a good choice.\r\rT: Right this way, and we'll move on to something more interesting.","system", 8, 0xffffff, "center"), onAddCallback, TextGroup, generateProperties( null ), 1, 1 ) ;
		}

		public function addSpritesForLayerSprites(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, Hero, SpritesGroup , 30.000, 390.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Hero"
			addSpriteToLayer(null, Block, SpritesGroup , 210.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"purple" }, null ), onAddCallback );//"Block: purple"
			addSpriteToLayer(null, Block, SpritesGroup , 210.000, 120.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"purple" }, null ), onAddCallback );//"Block: purple"
			addSpriteToLayer(null, Block, SpritesGroup , 120.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"purple" }, null ), onAddCallback );//"Block: purple"
			addSpriteToLayer(null, Block, SpritesGroup , 300.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"purple" }, null ), onAddCallback );//"Block: purple"
			addSpriteToLayer(null, MrT, SpritesGroup , 420.000, 150.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"MrT"
			addSpriteToLayer(null, Door, SpritesGroup , 450.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"isVertical", value:true }, null ), onAddCallback );//"Door:V"
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
