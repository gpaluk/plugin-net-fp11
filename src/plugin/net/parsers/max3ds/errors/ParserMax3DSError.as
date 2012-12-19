package plugin.net.parsers.max3ds.errors 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class ParserMax3DSError extends Event 
	{
		
		public function ParserMax3DSError(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new ParserMax3DSError(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ParserMax3DSError", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}