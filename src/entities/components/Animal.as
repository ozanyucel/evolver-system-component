package entities.components
{
	import ash.fsm.EntityStateMachine;

	public class Animal
	{
		public var fsm : EntityStateMachine;

		public function Animal( fsm : EntityStateMachine )
		{
			this.fsm = fsm;
		}
	}
}
