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
	import plugin.net.parsers.max3ds.Reader3DS;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Key3DS 
	{
		
		public var frame: int = 0;
		public var flags: int = 0;
		public var tens: Number = 0;
		public var cont: Number = 0;
		public var bias: Number = 0;
		public var easeTo: Number = 0;
		public var easeFrom: Number = 0;
		public var value: Array = [ 0, 0, 0, 0 ];
		
		public function Key3DS() 
		{
			
		}
		
		public function read( model: Model3DS, r: Reader3DS, cp: Chunk3DS ): void
		{
			frame = r.readS32( cp );
			flags = r.readU16( cp );
			if ( 0 != ( flags & Key3DSFlags.USE_TENS.flag ) )
			{
				tens = r.readFloat( cp );
			}
			if ( 0 != ( flags & Key3DSFlags.USE_CONT.flag ) )
			{
				cont = r.readFloat( cp );
			}
			if ( 0 != ( flags & Key3DSFlags.USE_BIAS.flag ) )
			{
				bias = r.readFloat( cp );
			}
			if ( 0 != ( flags & Key3DSFlags.USE_EASE_TO.flag ) )
			{
				easeTo = r.readFloat( cp );
			}
			if ( 0 != ( flags & Key3DSFlags.USE_EASE_FROM.flag ) )
			{
				easeFrom = r.readFloat( cp );
			}
		}
		
	}

}