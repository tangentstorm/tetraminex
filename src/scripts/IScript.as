package scripts 
{
	public interface IScript 
	{
		function begin():void;
		function onFrame():void;
		function onTick():void;
		function isFinished():Boolean;
		function isModal():Boolean;
	}	
}