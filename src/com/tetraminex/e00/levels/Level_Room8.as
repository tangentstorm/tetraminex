//Code generated with DAME. http://www.dambots.com

package com.tetraminex.e00.levels
{
	import org.flixel.*;
	import flash.utils.Dictionary;
	// Custom imports:
    import com.tetraminex.core.*;    import com.tetraminex.core.sprites.*;
	public class Level_Room8 extends BaseLevel
	{
		//Embedded media...
		[Embed(source="mapCSV_Room8_Tiles.csv", mimeType="application/octet-stream")] public var CSV_Tiles:Class;
		[Embed(source="../../../../assets/images/tiles.png")] public var Img_Tiles:Class;
		[Embed(source="mapCSV_Room8_Walls.csv", mimeType="application/octet-stream")] public var CSV_Walls:Class;
		[Embed(source="../../../../assets/images/fenceGray.png")] public var Img_Walls:Class;

		//Tilemaps
		public var layerTiles:FlxTilemap;
		public var layerWalls:FlxTilemap;

		//Sprites
		public var SpritesGroup:FlxGroup = new FlxGroup;

		//Properties
		public var gravity:Boolean = true;


		public function Level_Room8(addToStage:Boolean = true, onAddCallback:Function = null, parentObject:Object = null)
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
			addSpritesForLayerSprites(onAddCallback);
			generateObjectLinks(onAddCallback);
			if ( parentObject != null )
				parentObject.add(masterLayer);
			else
				FlxG.state.add(masterLayer);
		}

		public function addSpritesForLayerSprites(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, Hero, SpritesGroup , 360.000, 270.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Hero"
			addSpriteToLayer(null, Teleporter, SpritesGroup , 210.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Teleporter"
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
