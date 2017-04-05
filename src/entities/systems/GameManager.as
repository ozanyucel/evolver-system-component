package entities.systems
{
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;
	import entities.nodes.AnimalCollisionNode;
	import entities.nodes.GameNode;
	import flash.geom.Point;

	public class GameManager extends System
	{
		private var config : GameConfig;
		private var creator : EntityCreator;
		
		private var gameNodes : NodeList;
		private var animals : NodeList;
		private var _animalCount = 0;

		public function GameManager( creator : EntityCreator, config : GameConfig )
		{
			this.creator = creator;
			this.config = config;
		}

		override public function addToEngine( engine : Engine ) : void
		{
			gameNodes = engine.getNodeList( GameNode );
			animals = engine.getNodeList( AnimalCollisionNode );
		}
		
		override public function update( time : Number ) : void
		{
			var node : GameNode = gameNodes.head;
			if( node )
			{
				if (_animalCount >= 50)
					return;
				
				node.state.animalCreateTime -= time;
				if (node.state.animalCreateTime <= 0) {
					var position : Point = new Point( Math.random() * config.width, Math.random() * config.height );
					creator.createAnimal(60, position.x, position.y);
					node.state.animalCreateTime = node.state.ANIMAL_CREATE_TIME;
					_animalCount++;
				}
			}
		}

		override public function removeFromEngine( engine : Engine ) : void
		{
			gameNodes = null;
			animals = null;
		}
	}
}
