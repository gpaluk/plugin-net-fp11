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
	import plugin.net.parsers.max3ds.enum.Node3DSType;
	import plugin.net.parsers.max3ds.enum.Track3DSType;
	
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class AmbientColorNode3DS extends Node3DS
	{
		
		public var color: Array = [ 0, 0, 0 ];
		public var colorTrack: Track3DS = new Track3DS( Track3DSType.VECTOR );
		
		public function AmbientColorNode3DS() 
		{
			super( Node3DSType.AMBIENT_COLOR );
			name = "$AMBIENT$";
		}
		
	}

}