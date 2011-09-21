//Code generated with DAME. http://www.dambots.com

package levels
{
	import org.flixel.*;
	// Custom imports:
import sprites.*;
	public class Level_Room0 extends BaseLevel
	{
		//Embedded media...
		[Embed(source="mapCSV_Room0_Tiles.csv", mimeType="application/octet-stream")] public var CSV_Tiles:Class;
		[Embed(source="../assets/images/tiles.png")] public var Img_Tiles:Class;
		[Embed(source="mapCSV_Room0_Walls.csv", mimeType="application/octet-stream")] public var CSV_Walls:Class;
		[Embed(source="../assets/images/fenceGray.png")] public var Img_Walls:Class;

		//Tilemaps
		public var layerTiles:FlxTilemap;
		public var layerWalls:FlxTilemap;

		//Sprites
		public var SpritesGroup:FlxGroup = new FlxGroup;

		//Shapes
		public var TextGroup:FlxGroup = new FlxGroup;

		//Properties


		public function Level_Room0(addToStage:Boolean = true, onAddCallback:Function = null)
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

			callbackNewData(new TextData(510.000, 150.000, 100.000, 50.000, 0.000, "T: Ernie Goldsmile, recent high school graduate! Welcome to Tetraminex. \r\rT: I'm Teddy Tetraminus, and I run this place. You can call me Mr T. \r\rT: Use your arrow keys to step this way, and I'll show you what we do around here!","system", 8, 0xffffff, "center"), onAddCallback, TextGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(30.000, 30.000, 100.000, 50.000, 0.000, "I: Goldsmile... Goldsmile... Nope. You're not on the list.\r\rI: Come back after you've been through training to choose an assignment.\r","system", 8, 0xffffff, "center"), onAddCallback, TextGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(510.000, 330.000, 100.000, 50.000, 0.000, "T: Good work. Now follow me!","system", 8, 0xffffff, "center"), onAddCallback, TextGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(150.000, 30.000, 100.000, 50.000, 0.000, "I: Welcome back, Ernie! Step in here to choose an assignment.","system", 8, 0xffffff, "center"), onAddCallback, TextGroup, generateProperties( null ), 1, 1 ) ;
		}

		public function addSpritesForLayerSprites(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, Billboard, SpritesGroup , 180.000, 150.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Billboard"
			addSpriteToLayer(null, Block, SpritesGroup , 150.000, 300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 180.000, 300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 240.000, 300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 270.000, 300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 300.000, 300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 330.000, 300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 360.000, 300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 420.000, 300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, MrT, SpritesGroup , 420.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"MrT"
			addSpriteToLayer(null, Ivan, SpritesGroup , 90.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Ivan"
			addSpriteToLayer(null, Hero, SpritesGroup , 60.000, 390.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Hero"
			addSpriteToLayer(null, Door, SpritesGroup , 60.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"isVertical", value:false }, null ), onAddCallback );//"Door:H"
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
