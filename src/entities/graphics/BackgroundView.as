package entities.graphics
{
	import flash.display.Shape;
	
	public class BackgroundView extends Shape
	{
		public function BackgroundView( width : Number, height : Number )
		{
			graphics.beginFill(0x556B2F);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}
	}
}
