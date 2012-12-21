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
	public class Node3DSFlags
	{
		
		public static const HIDDEN: Node3DSFlags = new Node3DSFlags( 0x000800 );
		public static const SHOW_PATH: Node3DSFlags = new Node3DSFlags( 0x010000 );
		public static const SMOOTHING: Node3DSFlags = new Node3DSFlags( 0x020000 );
		public static const MOTION_BLUR: Node3DSFlags = new Node3DSFlags( 0x100000 );
		public static const MORPH_MATERIALS: Node3DSFlags = new Node3DSFlags( 0x400000 );
		
		private var _flag: int;
		public function Node3DSFlags( flag: int ) 
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