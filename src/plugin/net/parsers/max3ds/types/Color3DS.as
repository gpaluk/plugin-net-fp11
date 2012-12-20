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
	public class Color3DS 
	{
		
		public var r: Number;
		public var g: Number;
		public var b: Number;
		
		public function Color3DS( r: Number = 0, g: Number = 0, b: Number = 0 ) 
		{
			this.r = r;
			this.g = g;
			this.b = b;
		}
		
	}

}