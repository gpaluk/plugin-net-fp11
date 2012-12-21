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
package plugin.net.parsers.max3ds 
{
	import flash.utils.ByteArray;
	import plugin.net.parsers.max3ds.errors.Parser3DSError;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Reader3DS 
	{
		
		public static const MAX_FILESIZE: int = int.MAX_VALUE;
		
		public var name: String;
		public var length: int;
		
		private var _buffer: ByteArray;
		
		public function Reader3DS( name: String, data: ByteArray  )
		{
			if ( MAX_FILESIZE < data.length )
			{
				throw new Parser3DSError( "Size of file exceeds practical limits." );
			}
			else
			{
				this.name = name;
				this.length = data.length;
				_buffer = data;
			}
		}
		
		public function readS8( cp: Chunk3DS ): int
		{
			_buffer.position = cp.pos++;
			return _buffer.readByte();
		}
		
		public function readU8( cp: Chunk3DS ): int
		{
			_buffer.position = cp.pos++;
			return _buffer.readUnsignedByte();
		}
		
		public function readU16( cp: Chunk3DS ): int
		{
			_buffer.position = cp.pos++;
			return _buffer.readUnsignedShort();
		}
		
		public function readS16( cp: Chunk3DS ): int
		{
			_buffer.position = cp.pos++;
			return _buffer.readShort();
		}
		
		public function readS32( cp: Chunk3DS ): int
		{
			_buffer.position = cp.pos++;
			return _buffer.readInt();
		}
		
		public function readU32( cp: Chunk3DS ): int
		{
			_buffer.position = cp.pos++;
			return _buffer.readUnsignedInt();
		}
		
		public function readFloat( cp: Chunk3DS ): Number
		{
			_buffer.position = cp.pos++;
			return _buffer.readFloat();
		}
		
		public function readString( cp: Chunk3DS ): String
		{
			_buffer.position = cp.pos++;
			
			var strBuffer: String = "";
			while ( cp.inside() )
			{
				var ch: int = _buffer.readByte();
				if ( 0 == ch )
				{
					return strBuffer;
				}
				else if ( 0 > ch )
				{
					throw new Parser3DSError( "Illegal value in string 0x" + ch.toString( 16 ) + "." );
				}
				else
				{
					strBuffer += String.fromCharCode( ch );
				}
			}
			throw new Parser3DSError( "Unterminated string." );
		}
		
		public function readVector( cp: Chunk3DS, v: Array ): void
		{
			v[ 0 ] = readFloat( cp );
			v[ 1 ] = readFloat( cp );
			v[ 2 ] = readFloat( cp );
		}
		
		public function readColor( cp: Chunk3DS, c: Array ): void
		{
			c[ 0 ] = readFloat( cp );
			c[ 1 ] = readFloat( cp );
			c[ 2 ] = readFloat( cp );
		}
		
		public function readPercentageS16( cp: Chunk3DS, defaultValue: Number ): Number
		{
			while ( cp.inside() )
			{
				var cp1: Chunk3DS = next( cp );
				switch( cp1.id )
				{
					case Chunk3DS.INT_PERCENTAGE :
							var i: int = readS16( cp1 );
							return ( 1 * i / 100 );
						break;
				}
			}
			return defaultValue;
		}
		
		public function readMaterialColor( cp: Chunk3DS, rgb: Array ): void
		{
			var lin: Boolean = false;
			var i: int;
			while ( cp.inside() )
			{
				var cp1: Chunk3DS = next( cp );
				switch( cp1.id )
				{
					case Chunk3DS.LIN_COLOR_24:
							for ( i = 0; i < 3; ++i )
							{
								rgb[ i ] = 1 * readU8( cp1 ) / 255;
							}
							lin = true;
						break;
					case Chunk3DS.COLOR_24:
							if ( !lin )
							{
								for ( i = 0; i < 3; ++i )
								{
									rgb[ i ] = 1 * readU8( cp1 ) / 255;
								}
							}
						break;
					case Chunk3DS.LIN_COLOR_F:
							for ( i = 0; i < 3; ++i )
							{
								rgb[ i ] = readFloat( cp1 );
							}
							lin = true;
						break;
					case Chunk3DS.COLOR_F:
							if ( !lin )
							{
								for ( i = 0; i < 3; ++i )
								{
									rgb[ i ] = readFloat( cp1 );
								}
							}
						break;
				}
			}
		}
		
		public function start(): Chunk3DS
		{
			var boot: Chunk3DS = Chunk3DS.createFromLength( length );
			var start: int = 0;
			var id: int = readU16( boot );
			var length: int = readS32( boot );
			return Chunk3DS.createFromPosition( start, id, length );
		}
		
		public function next( cp: Chunk3DS ): Chunk3DS
		{
			var start: int = cp.pos;
			var id: int = readU16( cp );
			var length: int = readS32( cp );
			var next: Chunk3DS = Chunk3DS.createFromPosition( start, id, length );
			cp.pos = next.next;
			return next;
		}
		
	}

}