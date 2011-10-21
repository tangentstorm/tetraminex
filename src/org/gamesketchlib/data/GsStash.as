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
		
		protected static var mShared:SharedObject = new SharedObject("GsStash");
		protected static var mInBatch:Boolean = false;
		protected static var mChanged:Boolean = false;
		
		public static function getItem(key:String, defaultItem:Object=null)
		{
			var res:Object = mShared[key];
			if (res == undefined || res == null) return defaultItem;
			return res;
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
		public static function beginBatch()
		{
			minBatch = true;
		}
		public static function endBatch()
		{
			if (minBatch) { flush(); }
			minBatch = false;
		}
		
		protected static function flush()
		{
			mShared.flush();
		}
		
	}

}