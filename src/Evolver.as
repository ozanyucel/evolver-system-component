package 
{
	import ash.core.Engine;
	import ash.tick.FrameTickProvider;
	import entities.systems.AnimationSystem;
	import entities.systems.AttractionTargetingSystem;
	import entities.systems.AudioSystem;
	import entities.systems.CollisionSystem;
	import entities.systems.DeathThroesSystem;
	import entities.systems.DirectionSystem;
	import entities.systems.GameManager;
	import entities.systems.HudSystem;
	import entities.systems.MovementSystem;
	import entities.systems.RenderSystem;
	import entities.systems.SystemPriorities;

	import flash.display.DisplayObjectContainer;

	public class Evolver
	{
		private var container : DisplayObjectContainer;
		private var engine : Engine;
		private var tickProvider : FrameTickProvider;
		private var creator : EntityCreator;
		private var config : GameConfig;
		
		public function Evolver( container : DisplayObjectContainer, width : Number, height : Number )
		{
			this.container = container;
			prepare( width, height );
		}
		
		private function prepare( width : Number, height : Number ) : void
		{
			engine = new Engine();
			creator = new EntityCreator( engine );
			config = new GameConfig();
			config.width = width;
			config.height = height;

			engine.addSystem( new GameManager( creator, config ), SystemPriorities.preUpdate );
			engine.addSystem( new DeathThroesSystem( creator ), SystemPriorities.update );
			engine.addSystem( new MovementSystem( config ), SystemPriorities.move );
			engine.addSystem( new DirectionSystem(), SystemPriorities.move );
			engine.addSystem( new CollisionSystem( creator ), SystemPriorities.resolveCollisions );
			engine.addSystem( new AttractionTargetingSystem(), SystemPriorities.resolveCollisions );
			engine.addSystem( new AnimationSystem(), SystemPriorities.animate );
			engine.addSystem( new HudSystem(), SystemPriorities.animate );
			engine.addSystem( new RenderSystem( container ), SystemPriorities.render );
			engine.addSystem( new AudioSystem(), SystemPriorities.render );
			
			creator.createBackground(width, height);
			creator.createGame();
		}
		
		public function start() : void
		{
			tickProvider = new FrameTickProvider( container );
			tickProvider.add( engine.update );
			tickProvider.start();
		}
	}
}
