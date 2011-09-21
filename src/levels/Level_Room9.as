//Code generated with DAME. http://www.dambots.com

package levels
{
	import org.flixel.*;
	// Custom imports:
import sprites.*;
	public class Level_Room9 extends BaseLevel
	{
		//Embedded media...
		[Embed(source="mapCSV_Room9_Tiles.csv", mimeType="application/octet-stream")] public var CSV_Tiles:Class;
		[Embed(source="../assets/images/tiles.png")] public var Img_Tiles:Class;
		[Embed(source="mapCSV_Room9_Walls.csv", mimeType="application/octet-stream")] public var CSV_Walls:Class;
		[Embed(source="../assets/images/fenceGray.png")] public var Img_Walls:Class;

		//Tilemaps
		public var layerTiles:FlxTilemap;
		public var layerWalls:FlxTilemap;

		//Sprites
		public var SpritesGroup:FlxGroup = new FlxGroup;

		//Properties


		public function Level_Room9(addToStage:Boolean = true, onAddCallback:Function = null)
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
			addSpritesForLayerSprites(onAddCallback);
			generateObjectLinks(onAddCallback);
			FlxG.state.add(masterLayer);
		}

		public function addSpritesForLayerSprites(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, Hero, SpritesGroup , 270.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Hero"
			addSpriteToLayer(null, Block, SpritesGroup , 240.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"red" }, null ), onAddCallback );//"Block: red"
			addSpriteToLayer(null, Block, SpritesGroup , 270.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"red" }, null ), onAddCallback );//"Block: red"
			addSpriteToLayer(null, Block, SpritesGroup , 240.000, 330.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"purple" }, null ), onAddCallback );//"Block: purple"
			addSpriteToLayer(null, Block, SpritesGroup , 300.000, 330.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"purple" }, null ), onAddCallback );//"Block: purple"
			addSpriteToLayer(null, Block, SpritesGroup , 240.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"purple" }, null ), onAddCallback );//"Block: purple"
			addSpriteToLayer(null, Block, SpritesGroup , 270.000, 330.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"purple" }, null ), onAddCallback );//"Block: purple"
			addSpriteToLayer(null, Block, SpritesGroup , 300.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"blue" }, null ), onAddCallback );//"Block: blue"
			addSpriteToLayer(null, Block, SpritesGroup , 210.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"blue" }, null ), onAddCallback );//"Block: blue"
			addSpriteToLayer(null, Block, SpritesGroup , 210.000, 330.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"blue" }, null ), onAddCallback );//"Block: blue"
			addSpriteToLayer(null, Block, SpritesGroup , 270.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"blue" }, null ), onAddCallback );//"Block: blue"
			addSpriteToLayer(null, Block, SpritesGroup , 180.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 150.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 120.000, 300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 120.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 150.000, 300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 240.000, 300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 270.000, 300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 150.000, 330.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 90.000, 330.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"cyan" }, null ), onAddCallback );//"Block: cyan"
			addSpriteToLayer(null, Block, SpritesGroup , 60.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"cyan" }, null ), onAddCallback );//"Block: cyan"
			addSpriteToLayer(null, Block, SpritesGroup , 60.000, 330.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"cyan" }, null ), onAddCallback );//"Block: cyan"
			addSpriteToLayer(null, Block, SpritesGroup , 90.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"cyan" }, null ), onAddCallback );//"Block: cyan"
			addSpriteToLayer(null, Block, SpritesGroup , 180.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"orange" }, null ), onAddCallback );//"Block: orange"
			addSpriteToLayer(null, Block, SpritesGroup , 150.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"orange" }, null ), onAddCallback );//"Block: orange"
			addSpriteToLayer(null, Block, SpritesGroup , 120.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"orange" }, null ), onAddCallback );//"Block: orange"
			addSpriteToLayer(null, Block, SpritesGroup , 150.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"orange" }, null ), onAddCallback );//"Block: orange"
			addSpriteToLayer(null, Block, SpritesGroup , 420.000, 60.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"gray" }, null ), onAddCallback );//"Block: gray"
			addSpriteToLayer(null, Block, SpritesGroup , 420.000, 30.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"gray" }, null ), onAddCallback );//"Block: gray"
			addSpriteToLayer(null, Door, SpritesGroup , 360.000, 450.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"isVertical", value:false }, null ), onAddCallback );//"Door:H"
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
