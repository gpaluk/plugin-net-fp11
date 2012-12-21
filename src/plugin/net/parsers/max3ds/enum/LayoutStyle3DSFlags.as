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
	public class LayoutStyle3DSFlags 
	{
		
		public static const SINGLE: LayoutStyle3DSFlags = LayoutStyle3DSFlags( 0 );
		public static const TWO_PANE_VERT_SPLIT: LayoutStyle3DSFlags = LayoutStyle3DSFlags( 1 );
		public static const TWO_PANE_HORIZ_SPLIT: LayoutStyle3DSFlags = LayoutStyle3DSFlags( 2 );
		public static const FOUR_PANE: LayoutStyle3DSFlags = LayoutStyle3DSFlags( 3 );
		public static const THREE_PANE_LEFT_SPLIT: LayoutStyle3DSFlags = LayoutStyle3DSFlags( 4 );
		public static const THREE_PANE_BOTTOM_SPLIT: LayoutStyle3DSFlags = LayoutStyle3DSFlags( 5 );
		public static const THREE_PANE_RIGHT_SPLIT: LayoutStyle3DSFlags = LayoutStyle3DSFlags( 6 );
		public static const THREE_PANE_TOP_SPLIT: LayoutStyle3DSFlags = LayoutStyle3DSFlags( 7 );
		public static const THREE_PANE_VERT_SPLIT: LayoutStyle3DSFlags = LayoutStyle3DSFlags( 8 );
		public static const THREE_PANE_HORIZ_SPLIT: LayoutStyle3DSFlags = LayoutStyle3DSFlags( 9 );
		public static const FOUR_PANE_LEFT_SPLIT: LayoutStyle3DSFlags = LayoutStyle3DSFlags( 10 );
		public static const FOUR_PANE_RIGHT_SPLIT: LayoutStyle3DSFlags = LayoutStyle3DSFlags( 11 );
		
		private var _flag: int;
		public function LayoutStyle3DSFlags( flag: int ) 
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