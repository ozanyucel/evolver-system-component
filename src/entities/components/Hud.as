package entities.components
{
	import entities.graphics.HudView;

	public class Hud
	{
		public var view : HudView;
		
		public function Hud( view : HudView )
		{
			this.view = view;
		}
	}
}
