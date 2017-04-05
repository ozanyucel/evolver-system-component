package entities.systems
{
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;
	import vo.NeighbourInfo;

	import entities.nodes.AnimalCollisionNode;
	import entities.nodes.GameNode;
	
	import flash.geom.Point;

	public class CollisionSystem extends System
	{
		private var creator : EntityCreator;
		
		private var games : NodeList;
		private var animals : NodeList;

		public function CollisionSystem( creator : EntityCreator )
		{
			this.creator = creator;
		}

		override public function addToEngine( engine : Engine ) : void
		{
			games = engine.getNodeList( GameNode );
			animals = engine.getNodeList( AnimalCollisionNode );
		}
		
		override public function update( time : Number ) : void
		{
			var animal1 : AnimalCollisionNode;
			var animal2 : AnimalCollisionNode;
			
			for ( animal1 = animals.head; animal1; animal1 = animal1.next )
			{
				animal1.neighbours.neighbours.length = 0;
				
				trace("Clear All Neighbours for animal1: " + animal1.entity.name);
				
				for ( animal2 = animals.head; animal2; animal2 = animal2.next )
				{
					if (animal1 == animal2)
						continue;
						
					var distance:Number = Point.distance( animal1.position.position, animal2.position.position );
					var neigbouringDistance:Number = animal1.collision.radius + animal2.collision.radius;
					
					if ( distance <= neigbouringDistance )
					{
						var ratio:Number = (neigbouringDistance - distance) / distance;
						
						animal1.neighbours.neighbours.push(new NeighbourInfo(animal2.position.position.x, animal2.position.position.y, -5 * ratio));
						
						trace("animal1: " + animal1.entity.name + " - " + animal1.position.position + ", animal2: " + animal2.entity.name + " - " + animal2.position.position 
								+ ", distance: " + distance + ", ratio: " + ratio);
					}
				}
			}
		}

		override public function removeFromEngine( engine : Engine ) : void
		{
			animals = null;
		}
	}
}
