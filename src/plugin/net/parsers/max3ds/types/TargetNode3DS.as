package plugin.net.parsers.max3ds.types 
{
	import plugin.net.parsers.max3ds.enum.Node3DSType;
	import plugin.net.parsers.max3ds.enum.Track3DSType;
	import plugin.net.parsers.max3ds.errors.Parser3DSError;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class TargetNode3DS extends Node3DS 
	{
		
		public var pos: Array = Vertex3DS.create();
		public var posTrack: Track3DS = new Track3DS( Track3DSType.VECTOR );
		
		public function TargetNode3DS( type: Node3DSType ) 
		{
			super( type );
			switch( type )
			{
				case Node3DSType.CAMERA_TARGET:
				case Node3DSType.SPOTLIGHT_TARGET:
					return;
				default:
					throw new Parser3DSError( "Invalid target node type." );
			}
		}
		
	}

}