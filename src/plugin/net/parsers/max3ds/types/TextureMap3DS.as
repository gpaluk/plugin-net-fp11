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
	import plugin.net.parsers.max3ds.Reader3DS;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class TextureMap3DS 
	{
		
		public var userID: int;
		public var userPtr: Object;
		public var name: String;
		public var flags: int = 0x10;
		public var percent: Number = 1;
		public var blur: Number;
		public var scale: Array = [ 1, 1 ];
		public var offset: Array = [ 0, 0 ];
		public var rotation: Number;
		public var tint1: Array = [ 0, 0, 0 ];
		public var tint2: Array = [ 0, 0, 0 ];
		public var tintR: Array = [ 0, 0, 0 ];
		public var tintG: Array = [ 0, 0, 0 ];
		public var tintB: Array = [ 0, 0, 0 ];
		
		public function TextureMap3DS() 
		{
			
		}
		
		public function read( model: Model3DS, r: Reader3DS, cp: Chunk3DS ): void
		{
			while ( cp.inside() )
			{
				var cp1: Chunk3DS = r.next( cp );
				
				switch( cp1.id )
				{
					case Chunk3DS.INT_PERCENTAGE:
							percent = 1 * r.readS16( cp1 ) / 100;
						break;
					case Chunk3DS.MAT_MAPNAME:
							name = r.readString( cp1 );
						break;
					case Chunk3DS.MAT_MAP_TILING:
							flags = r.readU16( cp1 );
						break;
					case Chunk3DS.MAT_MAP_TEXBLUR:
							blur = r.readFloat( cp1 );
						break;
					case Chunk3DS.MAT_MAP_USCALE:
							scale[ 0 ] = r.readFloat( cp1 );
						break;
					case Chunk3DS.MAT_MAP_VSCALE:
							scale[ 1 ] = r.readFloat( cp1 );
						break;
					case Chunk3DS.MAT_MAP_UOFFSET:
							offset[ 0 ] = r.readFloat( cp1 );
						break;
					case Chunk3DS.MAT_MAP_VOFFSET:
							offset[ 1 ] = r.readFloat( cp1 );
						break;
					case Chunk3DS.MAT_MAP_ANG:
							rotation = r.readFloat( cp1 );
						break;
					case Chunk3DS.MAT_MAP_COL1:
							tint1[ 0 ] = 1 * r.readU8( cp1 ) / 255;
							tint1[ 1 ] = 1 * r.readU8( cp1 ) / 255;
							tint1[ 2 ] = 1 * r.readU8( cp1 ) / 255;
						break;
					case Chunk3DS.MAT_MAP_COL2:
							tint2[ 0 ] = 1 * r.readU8( cp1 ) / 255;
							tint2[ 1 ] = 1 * r.readU8( cp1 ) / 255;
							tint2[ 2 ] = 1 * r.readU8( cp1 ) / 255;
						break;
					case Chunk3DS.MAT_MAP_RCOL:
							tintR[ 0 ] = 1 * r.readU8( cp1 ) / 255;
							tintR[ 1 ] = 1 * r.readU8( cp1 ) / 255;
							tintR[ 2 ] = 1 * r.readU8( cp1 ) / 255;
						break;
					case Chunk3DS.MAT_MAP_GCOL:
							tintG[ 0 ] = 1 * r.readU8( cp1 ) / 255;
							tintG[ 1 ] = 1 * r.readU8( cp1 ) / 255;
							tintG[ 2 ] = 1 * r.readU8( cp1 ) / 255;
						break;
					case Chunk3DS.MAT_MAP_BCOL:
							tintB[ 0 ] = 1 * r.readU8( cp1 ) / 255;
							tintB[ 1 ] = 1 * r.readU8( cp1 ) / 255;
							tintB[ 2 ] = 1 * r.readU8( cp1 ) / 255;
						break;
				}
			}
		}
		
	}

}