package  
{
	import org.flixel.*;
	import rooms.*;
	import sprites.*;
	import tiles.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Room 
	{
		
		public static const N:int = 3;
		public static const S:int = 0;
		public static const W:int = 2;
		public static const E:int = 1;
		
		public static const kCellW:int = 30;
		public static const kCellH:int = 30;
		public static const kRoomW:int = 16;
		public static const kRoomH:int = 16;
		
		public static const pointN:FlxPoint = new FlxPoint( 0, -1);
		public static const pointS:FlxPoint = new FlxPoint( 0, +1);
		public static const pointE:FlxPoint = new FlxPoint( +1, 0);
		public static const pointW:FlxPoint = new FlxPoint( -1, 0);
		
		private var nullSprite:NullSprite = new NullSprite(0, 0);
		private var mTiles:Vector.<GridTile> = new Vector.<GridTile>(256, true);
		private var mSprites:Vector.<GridSprite> = new Vector.<GridSprite>(256, true);
		public var ernie:Hero;
		public var teddy:Teddy;
		
		private var mCagesLeft:int = 0;
		private var mExit:ExitTile = null;
		private var mExitCallback:Function;
		
		private var mInSetup:Boolean = true;
		public static const kCollideIndex:int = 4;
		public var gravity:Boolean;
		public var script:RoomScript;
		public var talkWindow:TalkWindow;
		
		
		public function Room() 
		{
			for (var i:int = 0; i < kRoomW * kRoomH; ++i)
			{
				mTiles[i] = GridTile.nullTile;
			}
		}
		
		public function addSprite(sprite:GridSprite):void		
		{
			sprite.gx = sprite.x / kCellW;
			sprite.gy = sprite.y / kCellH;
			put(sprite, sprite.gx, sprite.gy);			
			sprite.room = this;
			sprite.moved(); // mostly to reposition Hero.grabbers
			if (sprite is Hero) ernie = sprite as Hero;
			if (sprite is Teddy) teddy = sprite as Teddy;
		}
		
		public function addWalls(walls:FlxTilemap):void
		{
			for (var y:int = 0; y < kRoomH; ++y)
			{
				for (var x:int = 0; x < kRoomW; ++x)
				{
					if (walls.getTile(x, y) >= kCollideIndex)
					{
						put(FlxG.state.add(new Wall()) as GridSprite, x, y);
					}
				}
			}
			
		}
		
		
		public function addTiles(map:FlxTilemap):void
		{
			for (var y:int = 0; y < kRoomH; ++y)
			{
				for (var x:int = 0; x < kRoomW; ++x)
				{
					var gt:GridTile = mTiles[y * kRoomW + x]
						= GridTile.fromMap(map.getTile(x, y));
						
					var gs:GridSprite = get(x, y);
					
					if (gt is ExitTile)
					{
						mExit = gt as ExitTile;						
						if (gs is Door)
						{
							mExit.door = gs as Door;
						}
					}
					else if (gt is CageTile)
					{					
						mCagesLeft++;
					}
					
					gt.onPut(gs, this);
				}
			}
			
		}
		
		public function neighbor(sprite:GridSprite, dir:FlxPoint):GridSprite
		{
			return this.get(sprite.gx + dir.x, sprite.gy + dir.y);
		}
		
		
		public function nudge(sprite:GridSprite, dir:FlxPoint):void
		{
			if (sprite.canMove(dir))
			{			
				var n:GridSprite = this.neighbor(sprite, dir);
				if (n is NullSprite || (sprite is Hero && (sprite as Hero).holding(n)))
				{
					// nothing to do
				}
				else
				{
					nudge(n, dir);
				}
				
				put(null, sprite.gx, sprite.gy);
				
				sprite.gx += dir.x;
				sprite.gy += dir.y;
				
				// wraparound:
				if (sprite.gx >= kRoomW) sprite.gx = 0;
				else if (sprite.gx < 0) sprite.gx = kRoomW -1;
				if (sprite.gy >= kRoomH) sprite.gy = 0;
				else if (sprite.gy < 0) sprite.gy = kRoomH -1;
				
				// call moved before put mostly so grabbers move first
				// otherwise, the put(null...) above might overwrite the
				// hero in the room.
				sprite.moved();			
				put(sprite, sprite.gx, sprite.gy);
			}
		}
		
		public static function positionSprite(what:FlxSprite, gx:int, gy:int):void
		{
			what.last.y = what.y = gy * kCellH;
			what.last.x = what.x = gx * kCellW;
			
			if (what is GridSprite)
			{
				(what as GridSprite).gx = gx;
				(what as GridSprite).gy = gy;
			}
			
		}
		
		public static function relativePositionSprite(what:FlxSprite, direction:int, relativeTo:GridSprite):void
		{
			var gx:Number = relativeTo.gx;
			var gy:Number = relativeTo.gy;
			
			switch (direction)
			{
				case Room.N:
					positionSprite(what, gx, gy-1);
					break;
				case Room.S:
					positionSprite(what, gx, gy+1);
					break;
				case Room.W:
					positionSprite(what, gx-1, gy);
					break;
				case Room.E:
					positionSprite(what, gx+1, gy);
					break;
				default:
					break;
			}
			
		}
		
		
		public function get(gx:int, gy:int):GridSprite
		{
			// as3's mod operator is all screwy for negatives :/
			gx = ((gx % kRoomW) + kRoomW) % kRoomW;
			gy = ((gy % kRoomH) + kRoomH) % kRoomH;
			var s:GridSprite = mSprites[gy * kRoomW + gx];
			return s == null ? nullSprite: s;
		}
		
		public function put(sprite:GridSprite, gx:int, gy:int):void
		{
			// as3's mod operator is all screwy for negatives :/
			gx = ((gx % kRoomW) + kRoomW) % kRoomW;
			gy = ((gy % kRoomH) + kRoomH) % kRoomH;
			
			var index:int = gy * kRoomW + gx;
			mSprites[index] = (sprite is NullSprite) ? null : sprite;
			if (sprite != null)
			{
				sprite.gx = gx;
				sprite.gy = gy;
				sprite.x = gx * kCellW;
				sprite.y = gy * kCellH;
				sprite.room = this;
				
				mTiles[index].onPut(sprite, this);
			}
		}
		
		public function putRelative(what:GridSprite, dir:int, relativeTo:GridSprite):void
		{
			var gx:Number = relativeTo.gx;
			var gy:Number = relativeTo.gy;
			
			if (what.room == this)
			{
				put(null, what.gx, what.gy);
			}
			
			switch (dir)
			{
				case Room.N:
					put(what, gx, gy-1);
					break;
				case Room.S:
					put(what, gx, gy+1);
					break;
				case Room.W:
					put(what, gx-1, gy);
					break;
				case Room.E:
					put(what, gx+1, gy);
					break;
				default:
					break;
			}
			
		}
		
		public function cageFilled():void 
		{
			--mCagesLeft;
			
			if (! mInSetup)
			{
				script.cageSolved(this, mCagesLeft);
				if (mCagesLeft == 0)
				{
					roomSolved();
				}
			}
		}
		
		public function roomSolved():void
		{
			script.roomSolved(this);
			mExit.open();
		}
		
		public function onHeroExit(callback:Function):void
		{
			mExitCallback = callback;
		}
		
		
		public function heroExit():void
		{
			mExitCallback();
		}
		
		public function doneBuilding():void
		{
			// no blocks in first room
			if (mCagesLeft == 0 && mExit != null)
			{
				mExit.open();
			}
			mInSetup = false;
			script.roomStarted(this);
		}
		
		public function tick():void 
		{
			if (gravity)
			{
				for (var y:int = kRoomH - 1; y > 0; --y)
				{
					for (var x:int = 0; x < kRoomW; ++x)
					{
						var gs:GridSprite = get(x, y);
						var up:GridSprite = get(x, y - 1);
						if ((gs is NullSprite) && up != nullSprite)						
						{
							if (up.held)
							{
								// do nothing, let hero handle it
							}
							else if (up is Hero)
							{
								// TODO: extract "Supported"
								if (ernie.dgy > 0)
								{
									ernie.dgy--;
								}
								else
								{
									var supported:Boolean = false;
									for (var i:int = 0; i < ernie.grabbers.length; ++i)
									{
										var g:Grabber = ernie.grabbers[i];
										if (g.exists)
										{
											var c:GridSprite = g.content;
											if (c != null && !(c is NullSprite))
											{
												if (c.immovable || neighbor(c, pointS).solid)
													supported = true;
											}
										}
									}
									if (! supported)
									{
										nudge(ernie, Room.pointS);
									}
								}
							}
							else
							{
								nudge(up, Room.pointS);
							}
						}
					}
				}
			}
		}
		
	}

}