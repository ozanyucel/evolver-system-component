package entities.nodes
{
	import ash.core.Node;
	import entities.components.Motion;
	import entities.components.Position;


	public class MovementNode extends Node
	{
		public var position : Position;
		public var motion : Motion;
	}
}
