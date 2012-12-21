/*
 * Plugin.IO - http://www.plugin.io
 * Copyright (c) 2012
 * 
 * This program is free  software: you can redistribute it and/or modify 
 * it under the terms of the GNU Lesser General Public License as published 
 * by the Free Software Foundation, either version 3 of the License, or 
 * (at your option) any later version.
 * 
 * This program  is  distributed in the hope that it will be useful, 
 * but WITHOUT ANY WARRANTY; without even the implied warranty of 
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
 * GNU Lesser General Public License for more details.
 * 
 * You should  have received a copy of the GNU Lesser General Public License
 * along with  this program; If not, see <http://www.gnu.org/licenses/>. 
 */
package plugin.net.parsers.max3ds.types 
{
	import plugin.net.parsers.max3ds.enum.Face3DSFlags;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Face3DS 
	{
		
		public var index: Array = [ 0, 0, 0 ];
		public var flags: Face3DSFlags;
		public var material: int = -1;
		public var smoothingGroup: int;
		
		public function Face3DS()
		{
			
		}
		
		public static function createQuantity( numFaces: int ): Array
		{
			var faces: Array = new Array( numFaces );
			for ( var i: int = 0; i < numFaces; ++i )
			{
				faces[ i ] = new Face3DS();
			}
			return faces;
		}
		
	}

}