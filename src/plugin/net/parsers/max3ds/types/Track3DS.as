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
	import plugin.net.parsers.max3ds.Chunk3DS;
	import plugin.net.parsers.max3ds.enum.Track3DSType;
	import plugin.net.parsers.max3ds.Reader3DS;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Track3DS 
	{
		
		public var type: Track3DSType;
		public var flags: int;
		public var keys: Array = [];
		
		public function Track3DS( type: Track3DSType ) 
		{
			super();
			this.type = type;
		}
		
		public function read( model: Model3DS, r: Reader3DS, cp: Chunk3DS ): void
		{
			flags = r.readU16( cp );
			cp.skip( 8 );
			var nKeys: int = r.readS32( cp );
			keys = [];
			
			switch( type )
			{
				case Track3DSType.BOOL:
					
					break;
				case Track3DSType.FLOAT:
					
					break;
				case Track3DSType.VECTOR:
					
					break;
				case Track3DSType.QUAT:
					
					break;
			}
		}
		
	}

}