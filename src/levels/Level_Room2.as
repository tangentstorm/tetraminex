//Code generated with DAME. http://www.dambots.com

package levels
{
	import org.flixel.*;
	// Custom imports:
import sprites.*;
	public class Level_Room2 extends BaseLevel
	{
		//Embedded media...
		[Embed(source="mapCSV_Room2_Tiles.csv", mimeType="application/octet-stream")] public var CSV_Tiles:Class;
		[Embed(source="../assets/images/tiles.png")] public var Img_Tiles:Class;
		[Embed(source="mapCSV_Room2_Walls.csv", mimeType="application/octet-stream")] public var CSV_Walls:Class;
		[Embed(source="../assets/images/fenceGray.png")] public var Img_Walls:Class;

		//Tilemaps
		public var layerTiles:FlxTilemap;
		public var layerWalls:FlxTilemap;

		//Sprites
		public var SpritesGroup:FlxGroup = new FlxGroup;

		//Shapes
		public var TextGroup:FlxGroup = new FlxGroup;

		//Properties


		public function Level_Room2(addToStage:Boolean = true, onAddCallback:Function = null)
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

			callbackNewData(new TextData(480.000, 30.000, 100.000, 50.000, 0.000, "T: Lots of companies push blocks around, Ernie, but at Tetraminex, we don't just push blocks...\r\rT: We pull them too! Use your [WASD] keys (or [,AOE] if you're a Dvorak man), and put these blocks into place.","system", 8, 0xffffff, "center"), onAddCallback, TextGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(480.000, 210.000, 100.000, 50.000, 0.000, "T: Ernie, you're a natural! Right this way for lesson three.","system", 8, 0xffffff, "center"), onAddCallback, TextGroup, generateProperties( null ), 1, 1 ) ;
		}

		public function addSpritesForLayerSprites(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, Block, SpritesGroup , 30.000, 390.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 420.000, 30.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 30.000, 420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 390.000, 30.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 60.000, 30.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"red" }, null ), onAddCallback );//"Block: red"
			addSpriteToLayer(null, Block, SpritesGroup , 420.000, 420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"red" }, null ), onAddCallback );//"Block: red"
			addSpriteToLayer(null, Block, SpritesGroup , 420.000, 390.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"red" }, null ), onAddCallback );//"Block: red"
			addSpriteToLayer(null, Block, SpritesGroup , 30.000, 30.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"red" }, null ), onAddCallback );//"Block: red"
			addSpriteToLayer(null, MrT, SpritesGroup , 330.000, 390.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"MrT"
			addSpriteToLayer(null, Hero, SpritesGroup , 150.000, 390.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Hero"
			addSpriteToLayer(null, Door, SpritesGroup , 240.000, 450.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"isVertical", value:false }, null ), onAddCallback );//"Door:H"
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
