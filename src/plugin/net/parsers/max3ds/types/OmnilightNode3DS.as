package plugin.net.parsers.max3ds.types 
{
	import plugin.net.parsers.max3ds.enum.Node3DSType;
	import plugin.net.parsers.max3ds.enum.Track3DSType;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class OmnilightNode3DS extends Node3DS 
	{
		
		public var pos: Vertex3DS.create();
		public var color: Color3DS.create();
		public var posTrack: Track3DS = new Track3DS( Track3DSType.VECTOR );
		public var colorTrack: Track3DS = new Track3DS( Track3DSType.VECTOR );
		
		public function OmnilightNode3DS() 
		{
			super( Node3DSType.OMNILIGHT );
		}
		
	}

}