package org.gamesketchlib.data 
{
	import flash.net.SharedObject;
	
	/**
	 * Simple client-side storage of key-value pairs.
	 * 
	 * A simple convenience wrapper SharedObject.
	 * Not as handy as FlxSave, but has a simple 
	 * API that'll work for java/js too.
	 */
	public class GsStash
	{
		
		protected static var mShared:SharedObject = SharedObject.getLocal("GsStash");
		protected static var mInBatch:Boolean = false;
		protected static var mChanged:Boolean = false;
		
		public static function getItem(key:String, defaultItem:Object=null):Object
		{
			return mShared.data[key] == undefined ? defaultItem : mShared.data[key];
		}
		
		public static function putItem(key:String, value:Object):Object
		{
			mShared.setProperty(key, value);
			if (! mInBatch)
			{
				flush();
			}
			return value;
		}
		
		// a probably-not-terribly important optimization:
		public static function beginBatch():void
		{
			mInBatch = true;
		}
		public static function endBatch():void
		{
			if (mInBatch) { flush(); }
			mInBatch = false;
		}
		
		public static function clear():void
		{
			mShared.clear();
		}
		
		protected static function flush():void
		{
			mShared.flush();
		}
		
	}

}