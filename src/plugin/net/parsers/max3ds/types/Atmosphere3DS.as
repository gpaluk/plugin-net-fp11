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
	import plugin.net.parsers.max3ds.Reader3DS;
	
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Atmosphere3DS 
	{
		
		public var useFog: Boolean = false;
		public var fogColor: Array = Color3DS.create();
		public var fogBackground: Boolean = false;
		public var fogNearPlane: Number = 0;
		public var fogNearDensity: Number = 0;
		public var fogFarPlane: Number = 0;
		public var fogFarDensity: Number = 0;
		public var useLayerFog: Boolean = false;
		public var layerFogFlags: int = 0;
		public var layerFogColor: Array = Color3DS.create();
		public var layerFogNearY: Number = 0;
		public var layerFogFarY: Number = 0;
		public var layerFogDensity: Number = 0;
		public var useDistCue: Boolean = false;
		public var distCueBackground: Boolean = false;
		public var distCueNearPlane: Number = 0;
		public var distCueNearDimming: Number = 0;
		public var distCueFarPlane: Number = 0;
		public var distCueFarDimming: Number = 0;
		
		public function Atmosphere3DS( model: Model3DS, r: Reader3DS, cp: Chunk3DS ) 
		{
			read( model, r, cp );
		}
		
		public function read( model: Model3DS, r: Reader3DS, cp: Chunk3DS ): void
		{
			var cp1: Chunk3DS = r.next( cp );
			var cp2: Chunk3DS;
			
			switch( cp1.id )
			{
				case Chunk3DS.FOG :
						fogNearPlane = r.readFloat( cp1 );
						fogNearDensity = r.readFloat( cp1 );
						fogFarPlane = r.readFloat( cp1 );
						fogFarDensity = r.readFloat( cp1 );
						
						while ( cp1.inside() )
						{
							cp2 = r.next( cp1 );
							switch( cp2.id )
							{
								case Chunk3DS.LIN_COLOR_F:
										r.readColor( cp2, fogColor );
									break;
								case Chunk3DS.COLOR_F:
									break;
								case Chunk3DS.FOG_BGND:
										fogBackground = true;
									break;
							}
						}
					break;
				case Chunk3DS.LAYER_FOG:
						var lin: Boolean = false;
						layerFogNearY = r.readFloat( cp1 );
						layerFogFarY = r.readFloat( cp1 );
						layerFogDensity = r.readFloat( cp1 );
						layerFogFlags = r.readS32( cp1 );
						
						while ( cp1.inside() )
						{
							cp2 = r.next( cp1 );
							switch( cp2.id )
							{
								case Chunk3DS.LIN_COLOR_F:
										r.readColor( cp2, layerFogColor );
										lin = true;
									break;
								case Chunk3DS.COLOR_F:
										//TODO if(!lin)...
										r.readColor( cp2, layerFogColor );
									break;
							}
						}
					break;
				case Chunk3DS.DISTANCE_CUE:
						distCueNearPlane = r.readFloat( cp1 );
						distCueNearDimming = r.readFloat( cp1 );
						distCueFarPlane = r.readFloat( cp1 );
						distCueFarDimming = r.readFloat( cp1 );
						
						while ( cp1.inside() )
						{
							cp2 = r.next( cp1 );
							switch( cp2.id )
							{
								case Chunk3DS.DCUE_BGND:
										distCueBackground = true;
									break;
							}
						}
					break;
				case Chunk3DS.USE_FOG:
						useFog = true;
					break;
				case Chunk3DS.USE_LAYER_FOG:
						useLayerFog = true;
					break;
				case Chunk3DS.USE_DISTANCE_CUE:
						useDistCue = true;
					break;
			}
		}
		
	}

}