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
	import plugin.net.parsers.max3ds.Chunk3DS;
	import plugin.net.parsers.max3ds.Reader3DS;
	
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Atmosphere3DS 
	{
		
		public var useFog: Boolean;
		public var fogColor: Array = [];
		public var fogBackground: Boolean;
		public var fogNearPlane: Number;
		public var fogNearDensity: Number;
		public var fogFarPlane: Number;
		public var fogFarDensity: Number;
		public var useLayerFog: Boolean;
		public var layerFogFlags: int;
		public var layerFogColor: Array = [];
		public var layerFogNearY: Number;
		public var layerFogFarY: Number;
		public var layerFogDensity: Number;
		public var useDistCue: Boolean;
		public var distCueBackground: Boolean;
		public var distCueNearPlane: Number;
		public var distCueNearDimming: Number;
		public var distCueFarPlane: Number;
		public var distCueFarDimming: Number;
		
		public function Atmosphere3DS( model: Model3DS, r: Reader3DS, cp: Chunk3DS ) 
		{
			read( model, r, cp );
		}
		
		public function read( model: Model3DS, r: Reader3DS, cp: Chunk3DS ): void
		{
			var cp1: Chunk3DS = r.next( cp );
			switch( cp1.id )
			{
				case Chunk3DS.FOG :
						fogNearPlane = r.readFloat( cp1 );
						fogNearDensity = r.readFloat( cp1 );
						fogFarPlane = r.readFloat( cp1 );
						fogFarDensity = r.readFloat( cp1 );
						
						while ( cp.inside() )
						{
							var cp2: Chunk3DS = r.next( cp1 );
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
							var cp2: Chunk3DS  = r.next( cp1 );
							switch( cp2.id )
							{
								case Chunk3DS.LIN_COLOR_F:
										r.readColor( cp2, layerFogColor );
										lin = true;
									break;
								case Chunk3DS.COLOR_F:
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
							var cp2: Chunk3DS = r.next( cp1 );
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