package plugin.net.parsers.max3ds.enum 
{
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Shading3DSType 
	{
		
		public static const WIRE_FRAME: Shading3DSType = new Shading3DSType( 0 );
		public static const FLAT: Shading3DSType = new Shading3DSType( 1 );
		public static const GOURAUD: Shading3DSType = new Shading3DSType( 2 );
		public static const PHONG: Shading3DSType = new Shading3DSType( 3 );
		public static const METAL: Shading3DSType = new Shading3DSType( 4 );
		
		private var _type: int;
		public function Shading3DSType( type: int ) 
		{
			_type = type;
		}
		
	}

}