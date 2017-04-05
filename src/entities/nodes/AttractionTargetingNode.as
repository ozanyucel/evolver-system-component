package entities.nodes
{
	import ash.core.Node;
	import entities.components.Motion;
	import entities.components.Neighbours;
	import entities.components.Position;

	public class AttractionTargetingNode extends Node
	{
		public var position : Position;
		public var motion : Motion;
		public var neighbours : Neighbours;
	}
}
