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
	public class Object3DSFlags 
	{
		
		public static const OBJECT_HIDDEN: Object3DSFlags = new Object3DSFlags( 0x01 );
		public static const OBJECT_VIS_LOFTER: Object3DSFlags = new Object3DSFlags( 0x02 );
		public static const OBJECT_DOESNT_CAST: Object3DSFlags = new Object3DSFlags( 0x04 );
		public static const OBJECT_MATTE: Object3DSFlags = new Object3DSFlags( 0x08 );
		public static const OBJECT_DONT_RCVSHADOW: Object3DSFlags = new Object3DSFlags( 0x10 );
		public static const OBJECT_FAST: Object3DSFlags = new Object3DSFlags( 0x20 );
		public static const OBJECT_FROZEN: Object3DSFlags = new Object3DSFlags( 0x40 );
		
		private var _flag: int;
		public function Object3DSFlags( flag: int ) 
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