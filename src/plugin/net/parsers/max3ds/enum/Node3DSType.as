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
	public class Node3DSType 
	{
		
		public static const AMBIENT_COLOR: Node3DSType = new Node3DSType( "Ambient", 0 );
		public static const MESH_INSTANCE: Node3DSType = new Node3DSType( "Mesh", 1 );
		public static const CAMERA: Node3DSType = new Node3DSType( "Camera", 2 );
		public static const CAMERA_TARGET: Node3DSType = new Node3DSType( "Camera Target", 3 );
		public static const OMNILIGHT: Node3DSType = new Node3DSType( "Omnilight", 4 );
		public static const SPOTLIGHT: Node3DSType = new Node3DSType( "Spotlight", 5 );
		public static const SPOTLIGHT_TARGET: Node3DSType = new Node3DSType( "Spotlight Target", 6 );
		
		private var _label: String;
		private var _type: int;
		public function Node3DSType( label: String, type: int ) 
		{
			_label = label;
			_type = type;
		}
		
		[Inline]
		public final function get label():String 
		{
			return _label;
		}
		
		[Inline]
		public final function get type():int 
		{
			return _type;
		}
		
	}

}