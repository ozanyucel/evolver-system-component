package entities.systems
{
	import ash.tools.ListIteratingSystem;
	import entities.components.Display;
	import entities.components.Motion;
	import entities.nodes.DirectionNode;

	public class DirectionSystem extends ListIteratingSystem
	{
		public function DirectionSystem( )
		{
			super( DirectionNode, updateNode );
		}

		private function updateNode( node : DirectionNode, time : Number ) : void
		{
			var display : Display = node.display;
			var motion : Motion = node.motion;

			if (motion.direction.x > 0)
				display.displayObject.scaleX = -1;
			else display.displayObject.scaleX = 1;
		}
	}
}
