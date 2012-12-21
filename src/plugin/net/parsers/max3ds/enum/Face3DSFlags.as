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
package plugin.net.parsers.max3ds.enum 
{
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Face3DSFlags 
	{
		
		public static const VIS_AC: Face3DSFlags = new Face3DSFlags( 0x01 );
		public static const VIS_BC: Face3DSFlags = new Face3DSFlags( 0x02 );
		public static const VIS_AB: Face3DSFlags = new Face3DSFlags( 0x04 );
		public static const WRAP_U: Face3DSFlags = new Face3DSFlags( 0x08 );
		public static const WRAP_V: Face3DSFlags = new Face3DSFlags( 0x10 );
		public static const SELECT_3: Face3DSFlags = new Face3DSFlags( 1 << 13 );
		public static const SELECT_2: Face3DSFlags = new Face3DSFlags( 1 << 14 );
		public static const SELECT_1: Face3DSFlags = new Face3DSFlags( 1 << 15 );
		
		private var _flag: int;
		public function Face3DSFlags( flag: int ) 
		{
			_flag = flag;
		}
		
		[Inline]
		public final function get flag():int 
		{
			return _flag;
		}
		
		[Inline]
		public final function set flag(value:int):void 
		{
			_flag = value;
		}
		
	}

}