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
	public class Light3DS 
	{
		
		public var userId: int;
		public var userPtr: Object;
		public var name: String;
		public var objectFlags: int;
		public var spotLight: Boolean;
		public var seeCone: Boolean;
		public var color: Array = [];
		public var position: Array = [];
		public var target: Array = [];
		public var roll: Number;
		public var off: Boolean;
		public var outerRange: Number;
		public var innerRange: Number;
		public var multiplier: Number;
		public var attenuation: Number;
		public var rectangularSpot: Boolean;
		public var shadowed: Boolean;
		public var shadowBias: Number;
		public var shadowFilter: Number;
		public var shadowSize: int;
		public var spotAspect: Number;
		public var useProjector: Boolean;
		public var projector: String;
		public var spotOvershoot: Boolean;
		public var rayShadows: Boolean;
		public var rayBias: Number;
		public var hotspot: Number;
		public var falloff: Number;
		
		public function Light3DS() 
		{
			
		}
		
	}

}