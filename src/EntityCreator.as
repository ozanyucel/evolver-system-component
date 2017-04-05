package 
{
	import ash.core.Engine;
	import ash.core.Entity;
	import ash.fsm.EntityStateMachine;
	import entities.components.Animal;
	import entities.components.Animation;
	import entities.components.Audio;
	import entities.components.Collision;
	import entities.components.DeathThroes;
	import entities.components.Display;
	import entities.components.GameState;
	import entities.components.Hud;
	import entities.components.Motion;
	import entities.components.Neighbours;
	import entities.components.Position;
	import entities.graphics.AnimalDeathView;
	import entities.graphics.AnimalView;
	import entities.graphics.BackgroundView;
	import entities.graphics.HudView;

	public class EntityCreator
	{
		private var engine : Engine;
		private var waitEntity : Entity;
		
		public function EntityCreator( engine : Engine )
		{
			this.engine = engine;
		}
		
		public function destroyEntity( entity : Entity ) : void
		{
			engine.removeEntity( entity );
		}
		
		public function createGame() : Entity
		{
			var hud : HudView = new HudView();
			var gameEntity : Entity = new Entity( "game" )
				.add( new GameState() )
				.add( new Hud( hud ) )
				.add( new Display( hud ) )
				.add( new Position( 0, 0, 0 ) );
			engine.addEntity( gameEntity );
			return gameEntity;
		}
		
		public function createBackground( width : Number, height : Number ) : void
		{
			var bg : BackgroundView = new BackgroundView(width, height);
			var bgEntity : Entity = new Entity( "bg" )
				.add( new Display( bg ) )
				.add( new Position( 0, 0, 0 ) );
			engine.addEntity( bgEntity );
		}

		public function createAnimal( radius : Number, x : Number, y : Number ) : Entity
		{
			var animal : Entity = new Entity();
			
			var fsm : EntityStateMachine = new EntityStateMachine( animal );
			
			fsm.createState( "alive" )
				.add( Motion ).withInstance( new Motion( 0, 0, 0, 50 ) )
				//.add( Motion ).withInstance( new Motion( ( Math.random() - 0.5 ) * 4 * ( 50 - radius ), ( Math.random() - 0.5 ) * 4 * ( 50 - radius ), 0, 0 ) )
				.add( Collision ).withInstance( new Collision( radius ) )
				.add( Display ).withInstance( new Display( new AnimalView() ) )
				.add( Neighbours ).withInstance( new Neighbours() );
			
			var deathView : AnimalDeathView = new AnimalDeathView( radius );
			fsm.createState( "destroyed" )
				.add( DeathThroes ).withInstance( new DeathThroes( 3 ) )
				.add( Display ).withInstance( new Display( deathView ) )
				.add( Animation ).withInstance( new Animation( deathView ) );
			
			animal
				.add( new Animal( fsm ) )
				.add( new Position( x, y, 0 ) )
				.add( new Audio );
				
			fsm.changeState( "alive" );
			engine.addEntity( animal );
			return animal;
		}
	}
}
