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
	public class Light3DS 
	{
		
		public var userId: int = 0;
		public var userPtr: Object = {};
		public var name: String = "";
		public var objectFlags: int = 0;
		public var spotLight: Boolean = false;
		public var seeCone: Boolean = false;
		public var color: Array = Color3DS.create();
		public var position: Array = Vertex3DS.create();
		public var target: Array = Vertex3DS.create();
		public var roll: Number = 0;
		public var off: Boolean = false;
		public var outerRange: Number = 0;
		public var innerRange: Number = 0;
		public var multiplier: Number = 0;
		public var attenuation: Number = 0;
		public var rectangularSpot: Boolean = false;
		public var shadowed: Boolean = false;
		public var shadowBias: Number = 0;
		public var shadowFilter: Number = 0;
		public var shadowSize: int = 0;
		public var spotAspect: Number = 0;
		public var useProjector: Boolean = false;
		public var projector: String = "";
		public var spotOvershoot: Boolean = false;
		public var rayShadows: Boolean = false;
		public var rayBias: Number = 0;
		public var hotspot: Number = 0;
		public var falloff: Number = 0;
		
		public function Light3DS() 
		{
			
		}
		
	}

}