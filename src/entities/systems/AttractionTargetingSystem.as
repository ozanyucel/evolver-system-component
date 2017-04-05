package entities.systems
{
	import ash.tools.ListIteratingSystem;
	import entities.components.Motion;
	import entities.components.Position;
	import entities.nodes.AttractionTargetingNode;
	import entities.nodes.MovementNode;
	import vo.NeighbourInfo;

	public class AttractionTargetingSystem extends ListIteratingSystem
	{
		private var config : GameConfig;
		
		public function AttractionTargetingSystem()
		{
			super( AttractionTargetingNode, updateNode );
		}

		private function updateNode( node : AttractionTargetingNode, time : Number ) : void
		{
			if (node.neighbours.neighbours.length == 0) {
				if (node.motion.velocity != 20) {
					var dirX:Number = randRange(0, 1);
					var dirY:Number = 1 - dirX;
					var sign:int = (Math.floor(randRange(0, 2)) == 1) ? 1 : -1;
					node.motion.direction.x = dirX * sign;
					node.motion.direction.y = dirY * sign;
					node.motion.direction.normalize(1);
					node.motion.velocity = 20;					
				}
				return;
			}
			
			for each (var neighbour:NeighbourInfo in node.neighbours.neighbours) 
			{
				dirX = -1 * (neighbour.x - node.position.position.x);
				dirY = -1 * (neighbour.y - node.position.position.y);
				node.motion.direction.x = dirX;
				node.motion.direction.y = dirY;
				node.motion.direction.normalize(1);
				node.motion.velocity = node.motion.maxVelocity;	
				
				trace(node.entity.name + " - " + node.position.position + ", direction: " + node.motion.direction);
				
				break;
			}
		}
		
		private function randRange(minNum:Number, maxNum:Number):Number 
        {
            return (Math.random() * (maxNum - minNum) + minNum);
        }
	}
}
