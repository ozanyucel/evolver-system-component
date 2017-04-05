package entities.systems
{
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;
	import entities.components.Display;
	import entities.components.Position;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import entities.nodes.RenderNode;

	public class RenderSystem extends System
	{
		public var container : DisplayObjectContainer;
		
		private var nodes : NodeList;
		
		public function RenderSystem( container : DisplayObjectContainer )
		{
			this.container = container;
		}
		
		override public function addToEngine( engine : Engine ) : void
		{
			nodes = engine.getNodeList( RenderNode );
			for( var node : RenderNode = nodes.head; node; node = node.next )
			{
				addToDisplay( node );
			}
			nodes.nodeAdded.add( addToDisplay );
			nodes.nodeRemoved.add( removeFromDisplay );
		}
		
		private function addToDisplay( node : RenderNode ) : void
		{
			container.addChild( node.display.displayObject );
		}
		
		private function removeFromDisplay( node : RenderNode ) : void
		{
			container.removeChild( node.display.displayObject );
		}
		
		override public function update( time : Number ) : void
		{
			var node : RenderNode;
			var position : Position;
			var display : Display;
			var displayObject : DisplayObject;
			
			for( node = nodes.head; node; node = node.next )
			{
				display = node.display;
				displayObject = display.displayObject;
				position = node.position;
				
				displayObject.x = position.position.x;
				displayObject.y = position.position.y;
				displayObject.rotation = position.rotation * 180 / Math.PI;
			}
		}

		override public function removeFromEngine( engine : Engine ) : void
		{
			nodes = null;
		}
	}
}
