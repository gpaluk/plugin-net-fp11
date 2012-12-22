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
	import plugin.net.parsers.max3ds.Chunk3DS;
	import plugin.net.parsers.max3ds.Constants3DS;
	import plugin.net.parsers.max3ds.Reader3DS;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Camera3DS 
	{
		
		public var name: String = "";
		public var userId: int = 0;
		public var userPtr: Object = {};
		public var objectFlags: int = 0;
		public var position: Array = Vertex3DS.create();
		public var target: Array = Vertex3DS.create();
		public var roll: Number = 0;
		public var fov: Number = 45;
		public var seeCone: Boolean = false;
		public var nearRange: Number = 0;
		public var farRange: Number = 0;
		
		public function Camera3DS( model: Model3DS, r: Reader3DS, cp: Chunk3DS, name: String ) 
		{
			this.name = name;
			read( model, r, cp );
		}
		
		public function hasRanges(): Boolean
		{
			return ( 0 != nearRange || 0 != farRange );
		}
		
		public function read( model: Model3DS, r: Reader3DS,  cp: Chunk3DS ): void
		{
			r.readVector( cp, position );
			r.readVector( cp, target );
			roll = r.readFloat( cp );
			var s: Number = r.readFloat( cp );
			
			if ( Constants3DS.VECTOR_EPSILON > Math.abs( s ) )
			{
				fov = 45;
			}
			else
			{
				fov = ( 2400 / s );
			}
			
			while ( cp.inside() )
			{
				var cp2: Chunk3DS = r.next( cp );
				switch( cp2.id )
				{
					case Chunk3DS.CAM_SEE_CONE:
							seeCone = true;
						break;
					case Chunk3DS.CAM_RANGES:
							nearRange = r.readFloat( cp2 );
							farRange = r.readFloat( cp2 );
						break;
				}
			}
		}
	}

}