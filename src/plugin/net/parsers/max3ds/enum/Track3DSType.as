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
	public class Track3DSType 
	{
		
		public static const BOOL: Track3DSType = new Track3DSType( 0 );
		public static const FLOAT: Track3DSType = new Track3DSType( 1 );
		public static const VECTOR: Track3DSType = new Track3DSType( 3 );
		public static const QUAT: Track3DSType = new Track3DSType( 4 );
		
		private var _type: int;
		public function Track3DSType( type: int ) 
		{
			_type = type;
		}
		
		[Inline]
		public final function get type():int 
		{
			return _type;
		}
		
	}

}