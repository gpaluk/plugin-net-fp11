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
	public class Shading3DSType 
	{
		
		public static const WIRE_FRAME: Shading3DSType = new Shading3DSType( 0 );
		public static const FLAT: Shading3DSType = new Shading3DSType( 1 );
		public static const GOURAUD: Shading3DSType = new Shading3DSType( 2 );
		public static const PHONG: Shading3DSType = new Shading3DSType( 3 );
		public static const METAL: Shading3DSType = new Shading3DSType( 4 );
		
		private var _type: int;
		public function Shading3DSType( type: int ) 
		{
			_type = type;
		}
		
	}

}