package entities.systems
{
	import ash.tools.ListIteratingSystem;
	import entities.components.Motion;
	import entities.components.Position;
	import entities.nodes.MovementNode;

	public class MovementSystem extends ListIteratingSystem
	{
		private var config : GameConfig;
		
		public function MovementSystem( config : GameConfig )
		{
			this.config = config;
			
			super( MovementNode, updateNode );
		}

		private function updateNode( node : MovementNode, time : Number ) : void
		{
			var position : Position = node.position;
			var motion : Motion = node.motion;

			position.position.x += motion.velocityX * time;
			position.position.y += motion.velocityY * time;
			
			if ( position.position.x < 0 )
			{
				position.position.x += config.width;
			}
			if ( position.position.x > config.width )
			{
				position.position.x -= config.width;
			}
			if ( position.position.y < 0 )
			{
				position.position.y += config.height;
			}
			if ( position.position.y > config.height )
			{
				position.position.y -= config.height;
			}
		}
	}
}
