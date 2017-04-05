package entities.components
{
	import flash.geom.Point;
	
	public class Motion
	{
		public var direction : Point = new Point();
		public var velocity : Number = 0;
		public var maxVelocity : Number = 0;
		
		public function Motion( directionX : Number, directionY : Number, velocity : Number, maxVelocity : Number )
		{
			this.direction = new Point( directionX, directionY );
			this.velocity = velocity;
			this.maxVelocity = maxVelocity;
		}
		
		public function get velocityX():Number 
		{
			return direction.x * velocity;
		}
		
		public function get velocityY():Number 
		{
			return direction.y * velocity;
		}
	}
}
