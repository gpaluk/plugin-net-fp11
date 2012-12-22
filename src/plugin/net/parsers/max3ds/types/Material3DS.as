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
	public class Material3DS 
	{
		
		public static const DEFAULT_AMBIENT: Number = 0.588235;
		public static const DEFAULT_DIFFUSE: Number = 0.588235;
		public static const DEFAULT_SPECULAR: Number = 0.898039;
		public static const DEFAULT_SHININESS: Number = 0.1;
		public static const DEFAULT_WIRE_SIZE: Number = 1.0;
		public static const DEFAULT_SHADING: int = 3;
		
		public var userId: int = 0;
		public var userPtr: Object = {};
		public var name: String = "";
		public var ambient: Array = Color3DS.fromNumber( DEFAULT_AMBIENT );
		public var diffuse: Array = Color3DS.fromNumber( DEFAULT_DIFFUSE );
		public var specular: Array = Color3DS.fromNumber( DEFAULT_SPECULAR );
		public var shininess: Number = DEFAULT_SHININESS;
		public var shinStrength: Number = 0;
		public var useBlur: Boolean = false;
		public var blur: Number = 0;
		public var transparency: Number = 0;
		public var falloff: Number = 0;
		public var isAdditive: Boolean = false;
		public var selfIllumFlag: Boolean = false;
		public var selfIllum: Number = 0;
		public var useFalloff: Boolean = false;
		public var shading: int = DEFAULT_SHADING;
		public var soften: Boolean = false;
		public var faceMap: Boolean = false;
		public var twoSided: Boolean = false;
		public var mapDecal: Boolean = false;
		public var useWire: Boolean = false;
		public var useWireAbs: Boolean = false;
		public var wireSize: Number = DEFAULT_WIRE_SIZE;
		public var texture1Map: TextureMap3DS = new TextureMap3DS();
		public var texture1Mask: TextureMap3DS = new TextureMap3DS();
		public var texture2Map: TextureMap3DS = new TextureMap3DS();
		public var texture2Mask: TextureMap3DS = new TextureMap3DS();
		public var opacityMap: TextureMap3DS = new TextureMap3DS();
		public var opacityMask: TextureMap3DS = new TextureMap3DS();
		public var bumpMap: TextureMap3DS = new TextureMap3DS();
		public var bumpMask: TextureMap3DS = new TextureMap3DS();
		public var specularMap: TextureMap3DS = new TextureMap3DS();
		public var specularMask: TextureMap3DS = new TextureMap3DS();
		public var shininessMap: TextureMap3DS = new TextureMap3DS();
		public var shininessMask: TextureMap3DS = new TextureMap3DS();
		public var selfIllumMap: TextureMap3DS = new TextureMap3DS();
		public var selfIllumMask: TextureMap3DS = new TextureMap3DS();
		public var reflectionMap: TextureMap3DS = new TextureMap3DS();
		public var reflectionMask: TextureMap3DS = new TextureMap3DS();
		public var autoReflMapFlags: int = 0;
		public var autoReflMapAntiAlias: int = 0;
		public var autoReflMapSize: int = 0;
		public var autoReflMapFrameStep: int = 0;
		
		public function Material3DS( model:Model3DS, r: Reader3DS, cp: Chunk3DS ) 
		{
			read( model, r, cp );
		}
		
		public function read( model: Model3DS, r: Reader3DS, cp: Chunk3DS ): void
		{
			while ( cp.inside() )
			{
				var cp1: Chunk3DS = r.next( cp );
				switch( cp1.id )
				{
					case Chunk3DS.MAT_NAME:
							name = r.readString(cp1);
						break;
					case Chunk3DS.MAT_AMBIENT:
							r.readMaterialColor(cp1,ambient);
						break;
					case Chunk3DS.MAT_DIFFUSE:
							r.readMaterialColor(cp1,diffuse);
						break;
					case Chunk3DS.MAT_SPECULAR:
							r.readMaterialColor(cp1,specular);
						break;
					case Chunk3DS.MAT_SHININESS:
							shininess = r.readPercentageS16(cp1,shininess);
						break;
					case Chunk3DS.MAT_SHIN2PCT:
							shinStrength = r.readPercentageS16(cp1,shinStrength);
						break;
					case Chunk3DS.MAT_TRANSPARENCY:
							transparency = r.readPercentageS16(cp1,transparency);
						break;
					case Chunk3DS.MAT_XPFALL:
							falloff = r.readPercentageS16(cp1,falloff);
						break;
					case Chunk3DS.MAT_SELF_ILPCT:
							selfIllum = r.readPercentageS16(cp1, selfIllum);
						break;
					case Chunk3DS.MAT_USE_XPFALL:
							useFalloff = true;
						break;
					case Chunk3DS.MAT_REFBLUR:
							blur = r.readPercentageS16(cp1,blur);
						break;
					case Chunk3DS.MAT_USE_REFBLUR:
							useBlur = true;
						break;
					case Chunk3DS.MAT_SHADING:
							shading = r.readS16(cp1);
						break;
					case Chunk3DS.MAT_SELF_ILLUM:
							selfIllumFlag = true;
						break;
					case Chunk3DS.MAT_TWO_SIDE:
							twoSided = true;
						break;
					case Chunk3DS.MAT_DECAL:
							mapDecal = true;
						break;
					case Chunk3DS.MAT_ADDITIVE:
							isAdditive = true;
						break;
					case Chunk3DS.MAT_FACEMAP:
							faceMap = true;
						break;
					case Chunk3DS.MAT_PHONGSOFT:
							soften = true;
						break;
					case Chunk3DS.MAT_WIRE:
							useWire = true;
						break;
					case Chunk3DS.MAT_WIREABS:
							useWireAbs = true;
						break;
					case Chunk3DS.MAT_WIRE_SIZE:
							wireSize = r.readFloat(cp1);
						break;
					case Chunk3DS.MAT_TEXMAP:
							texture1Map.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_TEXMASK:
							texture1Mask.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_TEX2MAP:
							texture2Map.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_TEX2MASK:
							texture2Mask.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_OPACMAP:
							opacityMap.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_OPACMASK:
							opacityMask.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_BUMPMAP:
							bumpMap.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_BUMPMASK:
							bumpMask.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_SPECMAP:
							specularMap.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_SPECMASK:
							specularMask.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_SHINMAP:
							shininessMap.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_SHINMASK:
							shininessMask.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_SELFIMAP:
							selfIllumMap.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_SELFIMASK:
							selfIllumMask.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_REFLMAP:
							reflectionMap.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_REFLMASK:
							reflectionMask.read(model,r,cp1);
						break;
					case Chunk3DS.MAT_ACUBIC:
							cp1.skip(1);
							autoReflMapAntiAlias = r.readS8(cp1);
							autoReflMapFlags = r.readS16(cp1);
							autoReflMapSize = r.readS32(cp1);
							autoReflMapFrameStep = r.readS32(cp1);
						break;
				}
			}
		}
		
	}

}