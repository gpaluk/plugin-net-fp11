/*
 * Copyright (c) 2012 by Gary Paluk, all rights reserved.
 * Plugin.IO - http://www.plugin.io
 * 
 * Copyright (c) 1996-2008 by Jan Eric Kyprianidis, all rights reserved.
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
	import plugin.net.parsers.max3ds.enum.Key3DSFlags;
	import plugin.net.parsers.max3ds.enum.Track3DSType;
	import plugin.net.parsers.max3ds.Reader3DS;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Track3DS 
	{
		
		public var type: Track3DSType;
		public var flags: int = 0;
		public var keys: Array = [];
		
		public function Track3DS( type: Track3DSType ) 
		{
			this.type = type;
		}
		
		public function read( model: Model3DS, r: Reader3DS, cp: Chunk3DS ): void
		{
			flags = r.readU16( cp );
			cp.skip( 8 );
			var nKeys: int = r.readS32( cp );
			keys = new Array( nKeys );
			
			var i: int;
			switch( type )
			{
				case Track3DSType.BOOL:
						for ( i = 0; i < nKeys; ++i )
						{
							keys[ i ] = new Key3DS();
							keys[ i ].read( model, r, cp );
							keys[ i ].frame = r.readS32( cp );
						}
					break;
				case Track3DSType.FLOAT:
						for ( i = 0; i < nKeys; ++i )
						{
							keys[ i ] = new Key3DS();
							keys[ i ].read( model, r, cp );
							keys[ i ].value[ 0 ] = r.readFloat( cp );
						}
					break;
				case Track3DSType.VECTOR:
						for ( i = 0; i < nKeys; ++i )
						{
							keys[ i ] = new Key3DS();
							keys[ i ].read( model, r, cp );
							r.readVector( cp, keys[ i ].value );
						}
					break;
				case Track3DSType.QUAT:
						for ( i = 0; i < nKeys; ++i )
						{
							keys[ i ] = new Key3DS();
							keys[ i ].read( model, r, cp );
							keys[ i ].value[ 3 ] = r.readFloat( cp );
							r.readVector( cp, keys[ i ].value );
						}
					break;
			}
		}
		
	}

}