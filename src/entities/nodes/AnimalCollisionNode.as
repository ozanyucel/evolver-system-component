package entities.nodes
{
	import ash.core.Node;
	import entities.components.Neighbours;

	import entities.components.Animal;
	import entities.components.Audio;
	import entities.components.Collision;
	import entities.components.Position;

	
	public class AnimalCollisionNode extends Node
	{
		public var animal : Animal;
		public var neighbours : Neighbours;
		public var position : Position;
		public var collision : Collision;
		public var audio : Audio;
	}
}
