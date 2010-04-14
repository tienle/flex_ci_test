package
{
	import mx.controls.TextInput;

	public class MonkeyItemEditor extends TextInput
	{
		public function MonkeyItemEditor()
		{
			super();
		}
		override public function get automationName():String{
			return "scoozy";
		}
	}
}