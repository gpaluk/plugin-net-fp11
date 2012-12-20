package plugin.net.parsers.max3ds.types 
{
	import plugin.net.parsers.max3ds.enum.Node3DSType;
	import plugin.net.parsers.max3ds.enum.Track3DSType;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class SpotlightNode3DS extends Node3DS 
	{
		
		public var pos: Array = Vertex3DS.create();
		public var color: Array = Color3DS.create();
		public var hotspot: Number;
		public var falloff: Number;
		public var roll: Number;
		public var posTrack: Track3DS = new Track3DS( Track3DSType.VECTOR );
		public var colorTrack: Track3DS = new Track3DS( Track3DSType.VECTOR );
		public var hotspotTrack: Track3DS = new Track3DS( Track3DSType.FLOAT );
		public var falloffTrack: Track3DS = new Track3DS( Track3DSType.FLOAT );
		public var rollTrack: Track3DS = new Track3DS( Track3DSType.FLOAT );
		
		public function SpotlightNode3DS() 
		{
			super( Node3DSType.SPOTLIGHT );
		}
		
	}

}