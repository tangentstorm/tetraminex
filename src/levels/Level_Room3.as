//Code generated with DAME. http://www.dambots.com

package levels
{
	import org.flixel.*;
	// Custom imports:
import sprites.*;
	public class Level_Room3 extends BaseLevel
	{
		//Embedded media...
		[Embed(source="mapCSV_Room3_Tiles.csv", mimeType="application/octet-stream")] public var CSV_Tiles:Class;
		[Embed(source="../assets/images/tiles.png")] public var Img_Tiles:Class;
		[Embed(source="mapCSV_Room3_Walls.csv", mimeType="application/octet-stream")] public var CSV_Walls:Class;
		[Embed(source="../assets/images/fenceGray.png")] public var Img_Walls:Class;

		//Tilemaps
		public var layerTiles:FlxTilemap;
		public var layerWalls:FlxTilemap;

		//Sprites
		public var SpritesGroup:FlxGroup = new FlxGroup;

		//Shapes
		public var TextGroup:FlxGroup = new FlxGroup;

		//Properties


		public function Level_Room3(addToStage:Boolean = true, onAddCallback:Function = null)
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

			callbackNewData(new TextData(480.000, 60.000, 100.000, 50.000, 0.000, "T: You may have noticed that blocks lock in place when you move them over a holder.\r\rT: Be careful about the order you use. If you get stuck, press R to restart the assignment.","system", 8, 0xffffff, "center"), onAddCallback, TextGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(480.000, 210.000, 100.000, 50.000, 0.000, "T: I told you to be careful! Press R to try again.","system", 8, 0xffffff, "center"), onAddCallback, TextGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(480.000, 300.000, 100.000, 50.000, 0.000, "T: Excellent. Now let's move on to color.","system", 8, 0xffffff, "center"), onAddCallback, TextGroup, generateProperties( null ), 1, 1 ) ;
		}

		public function addSpritesForLayerSprites(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, Block, SpritesGroup , 120.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 90.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 90.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 120.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 180.000, 120.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"cyan" }, null ), onAddCallback );//"Block: cyan"
			addSpriteToLayer(null, Block, SpritesGroup , 210.000, 120.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"cyan" }, null ), onAddCallback );//"Block: cyan"
			addSpriteToLayer(null, Block, SpritesGroup , 240.000, 120.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"cyan" }, null ), onAddCallback );//"Block: cyan"
			addSpriteToLayer(null, Block, SpritesGroup , 270.000, 120.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"cyan" }, null ), onAddCallback );//"Block: cyan"
			addSpriteToLayer(null, MrT, SpritesGroup , 270.000, 60.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"MrT"
			addSpriteToLayer(null, Hero, SpritesGroup , 180.000, 60.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Hero"
			addSpriteToLayer(null, Door, SpritesGroup , 240.000, 0.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"isVertical", value:false }, null ), onAddCallback );//"Door:H"
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
