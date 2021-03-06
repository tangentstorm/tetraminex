package org.gamesketchlib.data 
{
	
	import flash.net.SharedObject;
	
	public class GsLevelLocker 
	{
		
		public static const LOCKED:String = "LOCKED";
		public static const UNPLAYED:String = "UNPLAYED";
		
		private var mTag:String;
		
		/**
		 * Track an arbitrary Object representing the score 
		 * for a numbered level.
		 * 
		 * Scores default to LOCKED so unvisited levels can
		 * be locked. Calling .unlock() changes to UNPLAYED
		 * until a score is recorded.
		 * 
		 * Always call .unlock() before calling .setScore()
		 * 
		 * You can pass an optional tag to the constructor, 
		 * so you can have a separate locker per world, 
		 * per user on the same client device, etc....
		 * 
		 */
		public function GsLevelLocker(tag:String="")
		{
			mTag = tag;
		}
		
		public function getScore(levelNum:int):Object
		{
			return GsStash.getItem(makeKey(levelNum), GsLevelLocker.LOCKED);
		}
		
		public function putScore(levelNum:int, score:Object):Object
		{
			GsStash.putItem(makeKey(levelNum), score);
			var score:Object = GsStash.getItem(makeKey(levelNum));
			return GsStash.putItem(makeKey(levelNum), score);
		}
		
		/**
		 * Build an array of score objects, including LOCKED and UNPLAYED.
		 * 
		 * @para   levelCount = number of values to return
		 * @param  startAt = the starting level number (will be at index 0)
		 * @return Array of scores for levels startLevel..levelCount
		 */
		public function getScores(levelCount:int, startLevel:int=0):Array
		{
			GsStash.beginBatch();
			var res:Array = new Array();
			for (var i:int = 0; i < levelCount; ++i)
			{
				res.push(getScore(startLevel + i));
			}
			GsStash.endBatch();
			return res;
		}
		
		/**
		 * Set's the level's score to UNPLAYED.
		 * Use this if you want to mark a level as playable 
		 * but not yet played.
		 * @param	levelNum
		 */
		public function unlock(levelNum:int):void
		{
			var score:Object= this.getScore(levelNum);
			if (score == GsLevelLocker.LOCKED)
			{
				this.putScore(levelNum, GsLevelLocker.UNPLAYED);
			}
		}
		
		/**
		 * Same as unlock(), but applied to a whole range.
		 * The range is: startLevel <= x < endLevel
		 * I.e., this will unlock startLevel but NOT endLevel.
		 */
		public function unlockRange(startLevel:int, endLevel:int):void
		{
			GsStash.beginBatch();
			for (var i:int = startLevel; i < endLevel; ++i)
			{
				this.unlock(i);
			}
			GsStash.endBatch();
		}
		
		public function isLocked(levelNum:int):Boolean
		{
			var score:String = this.getScore(levelNum) as String;
			trace("level " + levelNum + " is : " + this.getScore(levelNum) + ", isLocked=" + (score == GsLevelLocker.LOCKED));
			return this.getScore(levelNum) == GsLevelLocker.LOCKED;
		}
		
		
		private function makeKey(levelNum:int):String
		{
			return mTag + levelNum;
		}
		
	}

}