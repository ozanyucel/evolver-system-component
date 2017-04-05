package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width='1200', height='800', frameRate='60', backgroundColor='#000000')]

	public class Main extends Sprite
	{
		private var evolver : Evolver;
		
		public function Main()
		{
			addEventListener( Event.ENTER_FRAME, init );
		}
		
		private function init( event : Event ) : void
		{
			removeEventListener( Event.ENTER_FRAME, init );
			evolver = new Evolver( this, stage.stageWidth, stage.stageHeight );
			evolver.start();
		}
	}
}
