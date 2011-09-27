//Code generated with DAME. http://www.dambots.com

package levels
{
	import org.flixel.*;
	// Custom imports:
import sprites.*;
	public class Level_RoomX extends BaseLevel
	{
		//Embedded media...
		[Embed(source="mapCSV_RoomX_Tiles.csv", mimeType="application/octet-stream")] public var CSV_Tiles:Class;
		[Embed(source="../assets/images/tiles.png")] public var Img_Tiles:Class;
		[Embed(source="mapCSV_RoomX_Walls.csv", mimeType="application/octet-stream")] public var CSV_Walls:Class;
		[Embed(source="../assets/images/fenceGray.png")] public var Img_Walls:Class;

		//Tilemaps
		public var layerTiles:FlxTilemap;
		public var layerWalls:FlxTilemap;

		//Sprites
		public var SpritesGroup:FlxGroup = new FlxGroup;

		//Shapes
		public var TextGroup:FlxGroup = new FlxGroup;

		//Properties


		public function Level_RoomX(addToStage:Boolean = true, onAddCallback:Function = null)
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

			callbackNewData(new TextData(510.000, 30.000, 100.000, 50.000, 0.000, "T: Okay, Ernie. Time to see what you've learned.\r\rT: Remember, you can press R to start over if you get stuck.","system", 8, 0xffffff, "center"), onAddCallback, TextGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(510.000, 210.000, 100.000, 50.000, 0.000, "T: Congratulations, Ernie. You've completed your training.\r\rT: Now let's go see Ivan and find you an assignment.","system", 8, 0xffffff, "center"), onAddCallback, TextGroup, generateProperties( null ), 1, 1 ) ;
		}

		public function addSpritesForLayerSprites(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, Block, SpritesGroup , 180.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"blue" }, null ), onAddCallback );//"Block: blue"
			addSpriteToLayer(null, Block, SpritesGroup , 330.000, 390.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"gray" }, null ), onAddCallback );//"Block: gray"
			addSpriteToLayer(null, Block, SpritesGroup , 360.000, 390.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"gray" }, null ), onAddCallback );//"Block: gray"
			addSpriteToLayer(null, Block, SpritesGroup , 360.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"gray" }, null ), onAddCallback );//"Block: gray"
			addSpriteToLayer(null, Block, SpritesGroup , 390.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"gray" }, null ), onAddCallback );//"Block: gray"
			addSpriteToLayer(null, Hero, SpritesGroup , 30.000, 210.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Hero"
			addSpriteToLayer(null, Door, SpritesGroup , 0.000, 210.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"isVertical", value:true }, null ), onAddCallback );//"Door:V"
			addSpriteToLayer(null, MrT, SpritesGroup , 30.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"MrT"
			addSpriteToLayer(null, Block, SpritesGroup , 90.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"gray" }, null ), onAddCallback );//"Block: gray"
			addSpriteToLayer(null, Block, SpritesGroup , 120.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"gray" }, null ), onAddCallback );//"Block: gray"
			addSpriteToLayer(null, Block, SpritesGroup , 120.000, 390.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"gray" }, null ), onAddCallback );//"Block: gray"
			addSpriteToLayer(null, Block, SpritesGroup , 150.000, 390.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"gray" }, null ), onAddCallback );//"Block: gray"
			addSpriteToLayer(null, Block, SpritesGroup , 180.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"cyan" }, null ), onAddCallback );//"Block: cyan"
			addSpriteToLayer(null, Block, SpritesGroup , 210.000, 390.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"orange" }, null ), onAddCallback );//"Block: orange"
			addSpriteToLayer(null, Block, SpritesGroup , 270.000, 390.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"orange" }, null ), onAddCallback );//"Block: orange"
			addSpriteToLayer(null, Block, SpritesGroup , 240.000, 360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 240.000, 390.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"red" }, null ), onAddCallback );//"Block: red"
			addSpriteToLayer(null, Block, SpritesGroup , 300.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"red" }, null ), onAddCallback );//"Block: red"
			addSpriteToLayer(null, Block, SpritesGroup , 300.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 330.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"orange" }, null ), onAddCallback );//"Block: orange"
			addSpriteToLayer(null, Block, SpritesGroup , 330.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"purple" }, null ), onAddCallback );//"Block: purple"
			addSpriteToLayer(null, Block, SpritesGroup , 150.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 150.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"gray" }, null ), onAddCallback );//"Block: gray"
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
