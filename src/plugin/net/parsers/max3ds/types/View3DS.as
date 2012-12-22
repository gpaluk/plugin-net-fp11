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
	import plugin.net.parsers.max3ds.enum.View3DSType;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class View3DS 
	{
		
		public var type: View3DSType;
		public var axisLock: int = 0;
		public var position: Array = [ 0, 0 ];
		public var size: Array = [ 0, 0 ];
		public var zoom: Number = 0;
		public var center: Vertex3DS = new Vertex3DS();
		public var horizAngle: Number = 0;
		public var vertAngle: Number = 0;
		public var camera: String = "";
		
		public function View3DS() 
		{
			
		}
		
	}

}