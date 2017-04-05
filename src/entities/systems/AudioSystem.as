package entities.systems
{
	import ash.tools.ListIteratingSystem;

	import entities.nodes.AudioNode;

	import flash.media.Sound;


	public class AudioSystem extends ListIteratingSystem
	{
		public function AudioSystem()
		{
			super( AudioNode, updateNode );
		}

		private function updateNode( node : AudioNode, time : Number ) : void
		{
			for each( var type : Class in node.audio.toPlay )
			{
				var sound : Sound = new type();
				sound.play( 0, 1 );
			}
			node.audio.toPlay.length = 0;
		}
	}
}
