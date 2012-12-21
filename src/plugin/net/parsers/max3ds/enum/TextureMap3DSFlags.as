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
package plugin.net.parsers.max3ds.enum 
{
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class TextureMap3DSFlags 
	{
		
		public static const DECALE: TextureMap3DSFlags = new TextureMap3DSFlags( 0x0001 );
		public static const MIRROR: TextureMap3DSFlags = new TextureMap3DSFlags( 0x0002 );
		public static const NEGATE: TextureMap3DSFlags = new TextureMap3DSFlags( 0x0008 );
		public static const NO_TILE: TextureMap3DSFlags = new TextureMap3DSFlags( 0x0010 );
		public static const SUMMED_AREA: TextureMap3DSFlags = new TextureMap3DSFlags( 0x0020 );
		public static const ALPHA_SOURCE: TextureMap3DSFlags = new TextureMap3DSFlags( 0x0040 );
		public static const TINT: TextureMap3DSFlags = new TextureMap3DSFlags( 0x0080 );
		public static const IGNORE_ALPHA: TextureMap3DSFlags = new TextureMap3DSFlags( 0x0100 );
		public static const RGB_TINT: TextureMap3DSFlags = new TextureMap3DSFlags( 0x0200 );
		
		private var _flag: int;
		public function TextureMap3DSFlags( flag: int ) 
		{
			_flag = flag;
		}
		
		[Inline]
		public final function get flag():int 
		{
			return _flag;
		}
		
	}

}