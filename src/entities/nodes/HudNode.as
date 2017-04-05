package entities.nodes
{
	import ash.core.Node;

	import entities.components.GameState;
	import entities.components.Hud;

	public class HudNode extends Node
	{
		public var state : GameState;
		public var hud : Hud;
	}
}
