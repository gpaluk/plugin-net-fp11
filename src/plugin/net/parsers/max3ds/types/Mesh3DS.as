package plugin.net.parsers.max3ds.types 
{
	import plugin.net.parsers.max3ds.enum.Map3DSType;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Mesh3DS 
	{
		
		public var name: String;
		public var userId: int;
		public var userPtr: Object;
		public var objectFlags: int;
		public var color: int;
		public var matrix: Array = [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]];
		public var vertices: Array = [];
		public var texcos: Array = [];
		public var vFlags: Array = [];
		public var faces: Array = [];
		public var boxFront: String;
		public var boxBack: String;
		public var boxLeft: String;
		public var boxRight: String;
		public var boxTop: String;
		public var boxBottom: String;
		public var mapType: Map3DSType = Map3DSType.NONE;
		public var mapPos: Array = [ 0, 0, 0 ];
		public var mapMatrix: Array = [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]];
		public var mapScale: Number;
		public var mapTile: Array = [ 0, 0 ];
		public var mapPlanarSize: Array = [ 0, 0 ];
		public var mapCylinderHeight: Number;
		
		public function Mesh3DS() 
		{
			
		}
		
	}

}