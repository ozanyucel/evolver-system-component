package entities.systems
{
	import ash.tools.ListIteratingSystem;
	import entities.nodes.DeathThroesNode;

	public class DeathThroesSystem extends ListIteratingSystem
	{
		private var creator : EntityCreator;
		
		public function DeathThroesSystem( creator : EntityCreator )
		{
			super( DeathThroesNode, updateNode );
			this.creator = creator;
		}

		private function updateNode( node : DeathThroesNode, time : Number ) : void
		{
			node.death.countdown -= time;
			if ( node.death.countdown <= 0 )
			{
				creator.destroyEntity( node.entity );
			}
		}
	}
}
