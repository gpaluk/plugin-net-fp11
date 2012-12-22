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
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Vertex3DS 
	{
		
		// abstract
		public function Vertex3DS( ) 
		{
		}
		
		public static function create(): Array
		{
			return [ 0, 0, 0 ];
		}
		
		public static function resizeFloat( v: Array, z: int ): Array
		{
			for ( var i: int = 0; i < v.length; ++i )
			{
				v[ i ].length = z;
			}
			return v;
		}
		
		public static function resizeInt( v: Array, z: int ): Array
		{
			v.length = z;
			return v;
		}
		
	}

}