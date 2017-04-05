package entities.graphics
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class AnimalView extends Sprite
	{
		public function AnimalView()
		{
			var animal:MovieClip = new animal_ancestor();
			//var animal:MovieClip = new animal_ancestor_bmp();
			this.addChild(animal);
		}
	}
}
