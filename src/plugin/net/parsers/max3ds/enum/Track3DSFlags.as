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
	public class Track3DSFlags 
	{
		
		public static const REPEAT: Track3DSFlags = new Track3DSFlags( 0x0001 );
		public static const SMOOTH: Track3DSFlags = new Track3DSFlags( 0x0002 );
		public static const LOCK_X: Track3DSFlags = new Track3DSFlags( 0x0008 );
		public static const LOCK_Y: Track3DSFlags = new Track3DSFlags( 0x0010 );
		public static const LOCK_Z: Track3DSFlags = new Track3DSFlags( 0x0020 );
		public static const UNLINK_X: Track3DSFlags = new Track3DSFlags( 0x0100 );
		public static const UNLINK_Y: Track3DSFlags = new Track3DSFlags( 0x0200 );
		public static const UNLINK_Z: Track3DSFlags = new Track3DSFlags( 0x0400 );
		
		private var _flag: int;
		public function Track3DSFlags( flag: int ) 
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