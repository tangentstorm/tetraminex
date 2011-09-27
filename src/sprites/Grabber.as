package sprites 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Grabber extends GridSprite 
	{
		public var  dir:FlxPoint;
		public var owner:GridSprite;
		public var content: GridSprite;
		public var done:Boolean = false;
		
		public function Grabber(owner:GridSprite, dir:int)
		{
			super(0, 0);
			this.owner = owner;
			room = owner.room;
			loadGraphic(Tetraminex.ImgHands, true, true, Room.kCellW, Room.kCellH);
			this.frame = dir;
		}
		
		public static function makeGrabbers(forWhom:GridSprite, group:FlxGroup=null):Array
		{
			var g:Grabber;
			var res:Array = new Array();
			for (var i:int = 0; i < 4; ++i)
			{
				g = res[i] = new Grabber(forWhom,  i);
				g.owner = forWhom;
				Room.relativePositionSprite(g, i, forWhom);
				if (group != null)
					group.add(g);
			}
			return res;
		}
		
		public function reposition():void
		{
			var oldx:Number = x;
			var oldy:Number = y;
			Room.relativePositionSprite(this, this.frame, this.owner);
			// content may be null OR it may have disappeared (ex: a key into a lock)
			if (content && content.exists)
			{
				owner.room.putRelative(content, this.frame, this.owner);
			}
		}

		
		public var sling:Boolean = false;
		
		public function release():void
		{
			if (content != null)
			{
				content.held = false;
				// if (sling) { content.velocity.copyFrom(owner.velocity); }
			}
			
			content = null;
		}
		
		public function grab():void
		{
			content = owner.room.get(gx, gy);
			content.held = true;
		}
		
		
		override public function canMove(dir:FlxPoint):Boolean
		{
			// empty hands can go anywhere
			if ( !exists || content == null || content is NullSprite)
			{
				return true;
			}
			// we can always move into the square the owner is about to leave
			else if (owner.room.neighbor(content, dir) == owner)
			{
				return ! content.immovable;
			}
			// otherwise, default to the rules for the content
			else
			{
				return content.canMove(dir);
			}
		}
		
		
	}
}