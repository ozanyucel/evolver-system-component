package entities.components
{
	public class GameState
	{
		public var ANIMAL_CREATE_TIME:Number = 1;
		
		public var lives : int = 0;
		public var level : int = 0;
		public var hits : int = 0;
		public var animalCreateTime : Number = ANIMAL_CREATE_TIME;
		
		public function setForStart() : void
		{
			lives = 3;
			level = 0;
			hits = 0;
		}
	}
}
