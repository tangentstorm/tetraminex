//Code generated with DAME. http://www.dambots.com

package com.tetraminex.e00.levels
{
	import org.flixel.*;
	import flash.utils.Dictionary;
	// Custom imports:
    import com.tetraminex.core.*;    import com.tetraminex.core.sprites.*;
	public class Level_Room5 extends BaseLevel
	{
		//Embedded media...
		[Embed(source="mapCSV_Room5_Tiles.csv", mimeType="application/octet-stream")] public var CSV_Tiles:Class;
		[Embed(source="../../../../assets/images/tiles.png")] public var Img_Tiles:Class;
		[Embed(source="mapCSV_Room5_Walls.csv", mimeType="application/octet-stream")] public var CSV_Walls:Class;
		[Embed(source="../../../../assets/images/fenceGray.png")] public var Img_Walls:Class;

		//Tilemaps
		public var layerTiles:FlxTilemap;
		public var layerWalls:FlxTilemap;

		//Sprites
		public var SpritesGroup:FlxGroup = new FlxGroup;

		//Shapes
		public var ShapesGroup:FlxGroup = new FlxGroup;

		//Properties
		public var gravity:Boolean = false;


		public function Level_Room5(addToStage:Boolean = true, onAddCallback:Function = null, parentObject:Object = null)
		{
			// Generate maps.
			var properties:Array = [];
			var tileProperties:Dictionary = new Dictionary;

			properties = generateProperties( null );
			layerTiles = addTilemap( CSV_Tiles, Img_Tiles, 0.000, 0.000, 30, 30, 1.000, 1.000, false, 1, 1, properties, onAddCallback );
			properties = generateProperties( null );
			layerWalls = addTilemap( CSV_Walls, Img_Walls, 0.000, 0.000, 30, 30, 1.000, 1.000, false, 1, 1, properties, onAddCallback );

			//Add layers to the master group in correct order.
			masterLayer.add(layerTiles);
			masterLayer.add(layerWalls);
			masterLayer.add(SpritesGroup);
			masterLayer.add(ShapesGroup);

			if ( addToStage )
				createObjects(onAddCallback, parentObject);

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 480;
			boundsMaxY = 480;
			bgColor = 0xff000000;
		}

		override public function createObjects(onAddCallback:Function = null, parentObject:Object = null):void
		{
			addShapesForLayerShapes(onAddCallback);
			addSpritesForLayerSprites(onAddCallback);
			generateObjectLinks(onAddCallback);
			if ( parentObject != null )
				parentObject.add(masterLayer);
			else
				FlxG.state.add(masterLayer);
		}

		public function addShapesForLayerShapes(onAddCallback:Function = null):void
		{
			var obj:Object;

		}

		public function addSpritesForLayerSprites(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, Hero, SpritesGroup , 240.000, 30.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Hero"
			addSpriteToLayer(null, Block, SpritesGroup , 270.000, 90.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"red" }, null ), onAddCallback );//"Block: red"
			addSpriteToLayer(null, Block, SpritesGroup , 300.000, 90.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"red" }, null ), onAddCallback );//"Block: red"
			addSpriteToLayer(null, Block, SpritesGroup , 270.000, 150.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"purple" }, null ), onAddCallback );//"Block: purple"
			addSpriteToLayer(null, Block, SpritesGroup , 330.000, 150.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"purple" }, null ), onAddCallback );//"Block: purple"
			addSpriteToLayer(null, Block, SpritesGroup , 270.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"purple" }, null ), onAddCallback );//"Block: purple"
			addSpriteToLayer(null, Block, SpritesGroup , 300.000, 150.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"purple" }, null ), onAddCallback );//"Block: purple"
			addSpriteToLayer(null, Block, SpritesGroup , 330.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"blue" }, null ), onAddCallback );//"Block: blue"
			addSpriteToLayer(null, Block, SpritesGroup , 240.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"blue" }, null ), onAddCallback );//"Block: blue"
			addSpriteToLayer(null, Block, SpritesGroup , 240.000, 150.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"blue" }, null ), onAddCallback );//"Block: blue"
			addSpriteToLayer(null, Block, SpritesGroup , 300.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"blue" }, null ), onAddCallback );//"Block: blue"
			addSpriteToLayer(null, Block, SpritesGroup , 180.000, 60.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 150.000, 60.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 150.000, 120.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 150.000, 90.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"green" }, null ), onAddCallback );//"Block: green"
			addSpriteToLayer(null, Block, SpritesGroup , 180.000, 120.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 270.000, 120.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 300.000, 120.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 180.000, 150.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"yellow" }, null ), onAddCallback );//"Block: yellow"
			addSpriteToLayer(null, Block, SpritesGroup , 120.000, 150.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"cyan" }, null ), onAddCallback );//"Block: cyan"
			addSpriteToLayer(null, Block, SpritesGroup , 90.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"cyan" }, null ), onAddCallback );//"Block: cyan"
			addSpriteToLayer(null, Block, SpritesGroup , 90.000, 150.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"cyan" }, null ), onAddCallback );//"Block: cyan"
			addSpriteToLayer(null, Block, SpritesGroup , 120.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"cyan" }, null ), onAddCallback );//"Block: cyan"
			addSpriteToLayer(null, Block, SpritesGroup , 210.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"orange" }, null ), onAddCallback );//"Block: orange"
			addSpriteToLayer(null, Block, SpritesGroup , 180.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"orange" }, null ), onAddCallback );//"Block: orange"
			addSpriteToLayer(null, Block, SpritesGroup , 150.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"orange" }, null ), onAddCallback );//"Block: orange"
			addSpriteToLayer(null, Block, SpritesGroup , 180.000, 90.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"orange" }, null ), onAddCallback );//"Block: orange"
			addSpriteToLayer(null, Block, SpritesGroup , 420.000, 60.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"gray" }, null ), onAddCallback );//"Block: gray"
			addSpriteToLayer(null, Block, SpritesGroup , 420.000, 30.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"color", value:"gray" }, null ), onAddCallback );//"Block: gray"
			addSpriteToLayer(null, Door, SpritesGroup , 240.000, 0.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"isVertical", value:false }, null ), onAddCallback );//"Door:H"
			addSpriteToLayer(null, Door, SpritesGroup , 450.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"isVertical", value:true }, null ), onAddCallback );//"Door:V"
			addSpriteToLayer(null, Teddy, SpritesGroup , 420.000, 300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Teddy"
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
