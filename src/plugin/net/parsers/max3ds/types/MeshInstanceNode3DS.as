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
	import plugin.net.parsers.max3ds.enum.Node3DSType;
	import plugin.net.parsers.max3ds.enum.Track3DSFlags;
	import plugin.net.parsers.max3ds.enum.Track3DSType;
	
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class MeshInstanceNode3DS extends Node3DS 
	{
		
		public var pivot: Array = Vertex3DS.create();
		public var instanceName: String = "";
		public var bBoxMin: Array = Vertex3DS.create();
		public var bBoxMax: Array = Vertex3DS.create();
		public var hide: int = 0;
		public var pos: Array = Vertex3DS.create();
		public var rot: Array = [ 0, 0, 0, 0 ];
		public var scl: Array = Vertex3DS.create();
		public var morphSmooth: Number = 0;
		public var morph: String = "";
		public var posTrack: Track3DS = new Track3DS( Track3DSType.VECTOR );
		public var rotTrack: Track3DS = new Track3DS( Track3DSType.QUAT );
		public var sclTrack: Track3DS = new Track3DS( Track3DSType.VECTOR );
		public var hideTrack: Track3DS = new Track3DS( Track3DSType.BOOL );
		
		public function MeshInstanceNode3DS() 
		{
			super( Node3DSType.MESH_INSTANCE );
			name = "$$$DUMMY";
		}
		
	}

}