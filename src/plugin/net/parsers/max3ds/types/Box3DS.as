package plugin.net.parsers.max3ds.types 
{
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Box3DS 
	{
		
		public var min: Array = [];
		public var max: Array = [];
		public var center: Array;
		
		public function Box3DS( bounds: Boolean = false ) 
		{
			if ( bounds )
			{
				min[ 0 ] = Number.MAX_VALUE;
				min[ 1 ] = Number.MAX_VALUE;
				min[ 2 ] = Number.MAX_VALUE;
				
				max[ 0 ] = Number.MIN_VALUE;
				max[ 1 ] = Number.MIN_VALUE;
				max[ 2 ] = Number.MIN_VALUE;
			}
		}
		
		public function reset(): void
		{
			center = null;
		}
		
	}

}