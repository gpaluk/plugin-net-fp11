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
package plugin.net.parsers.max3ds.types 
{
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Box3DS 
	{
		
		public var min: Array = [];
		public var max: Array = [];
		public var center: Array;
		
		public function Box3DS( bounds: Boolean = false ) 
		{
			if ( bounds )
			{
				min[ 0 ] = Number.MAX_VALUE;
				min[ 1 ] = Number.MAX_VALUE;
				min[ 2 ] = Number.MAX_VALUE;
				
				max[ 0 ] = Number.MIN_VALUE;
				max[ 1 ] = Number.MIN_VALUE;
				max[ 2 ] = Number.MIN_VALUE;
			}
		}
		
		public function reset(): void
		{
			center = null;
		}
		
	}

}