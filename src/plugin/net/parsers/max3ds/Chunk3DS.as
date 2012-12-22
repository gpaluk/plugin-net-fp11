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
package plugin.net.parsers.max3ds 
{
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Chunk3DS 
	{
		public static const NULL_CHUNK: int             = 0x0000;
		public static const M3DMAGIC: int               = 0x4D4D;
		public static const SMAGIC: int                 = 0x2D2D;    
		public static const LMAGIC: int                 = 0x2D3D;    
		public static const MLIBMAGIC: int              = 0x3DAA;
		public static const MATMAGIC: int               = 0x3DFF;    
		public static const CMAGIC: int                 = 0xC23D;
		public static const M3D_VERSION: int            = 0x0002;
		public static const M3D_KFVERSION: int          = 0x0005;
		public static const COLOR_F: int                = 0x0010;
		public static const COLOR_24: int               = 0x0011;
		public static const LIN_COLOR_24: int           = 0x0012;
		public static const LIN_COLOR_F: int            = 0x0013;
		public static const INT_PERCENTAGE: int         = 0x0030;
		public static const FLOAT_PERCENTAGE: int       = 0x0031;
		public static const MDATA: int                  = 0x3D3D;
		public static const MESH_VERSION: int           = 0x3D3E;
		public static const MASTER_SCALE: int           = 0x0100;
		public static const LO_SHADOW_BIAS: int         = 0x1400;
		public static const HI_SHADOW_BIAS: int         = 0x1410;
		public static const SHADOW_MAP_SIZE: int        = 0x1420;
		public static const SHADOW_SAMPLES: int         = 0x1430;
		public static const SHADOW_RANGE: int           = 0x1440;
		public static const SHADOW_FILTER: int          = 0x1450;
		public static const RAY_BIAS: int               = 0x1460;
		public static const O_CONSTS: int               = 0x1500;
		public static const AMBIENT_LIGHT: int          = 0x2100;
		public static const BIT_MAP: int                = 0x1100;
		public static const SOLID_BGND: int             = 0x1200;
		public static const V_GRADIENT: int             = 0x1300;
		public static const USE_BIT_MAP: int            = 0x1101;
		public static const USE_SOLID_BGND: int         = 0x1201;
		public static const USE_V_GRADIENT: int         = 0x1301;
		public static const FOG: int                    = 0x2200;
		public static const FOG_BGND: int               = 0x2210;
		public static const LAYER_FOG: int              = 0x2302;
		public static const DISTANCE_CUE: int           = 0x2300;
		public static const DCUE_BGND: int              = 0x2310;
		public static const USE_FOG: int                = 0x2201;
		public static const USE_LAYER_FOG: int          = 0x2303;
		public static const USE_DISTANCE_CUE: int       = 0x2301;
		public static const MAT_ENTRY: int              = 0xAFFF;
		public static const MAT_NAME: int               = 0xA000;
		public static const MAT_AMBIENT: int            = 0xA010;
		public static const MAT_DIFFUSE: int            = 0xA020;
		public static const MAT_SPECULAR: int           = 0xA030;
		public static const MAT_SHININESS: int          = 0xA040;
		public static const MAT_SHIN2PCT: int           = 0xA041;
		public static const MAT_TRANSPARENCY: int       = 0xA050;
		public static const MAT_XPFALL: int             = 0xA052;
		public static const MAT_USE_XPFALL: int         = 0xA240;
		public static const MAT_REFBLUR: int            = 0xA053;
		public static const MAT_SHADING: int            = 0xA100;
		public static const MAT_USE_REFBLUR: int        = 0xA250;
		public static const MAT_SELF_ILLUM: int         = 0xA080;
		public static const MAT_TWO_SIDE: int           = 0xA081;
		public static const MAT_DECAL: int              = 0xA082;
		public static const MAT_ADDITIVE: int           = 0xA083;
		public static const MAT_SELF_ILPCT: int         = 0xA084;
		public static const MAT_WIRE: int               = 0xA085;
		public static const MAT_FACEMAP: int            = 0xA088;
		public static const MAT_PHONGSOFT: int          = 0xA08C;
		public static const MAT_WIREABS: int            = 0xA08E;
		public static const MAT_WIRE_SIZE: int          = 0xA087;
		public static const MAT_TEXMAP: int             = 0xA200;
		public static const MAT_SXP_TEXT_DATA: int      = 0xA320;
		public static const MAT_TEXMASK: int            = 0xA33E;
		public static const MAT_SXP_TEXTMASK_DATA: int  = 0xA32A;
		public static const MAT_TEX2MAP: int            = 0xA33A;
		public static const MAT_SXP_TEXT2_DATA: int     = 0xA321;
		public static const MAT_TEX2MASK: int           = 0xA340;
		public static const MAT_SXP_TEXT2MASK_DATA: int = 0xA32C;
		public static const MAT_OPACMAP: int            = 0xA210;
		public static const MAT_SXP_OPAC_DATA: int      = 0xA322;
		public static const MAT_OPACMASK: int           = 0xA342;
		public static const MAT_SXP_OPACMASK_DATA: int  = 0xA32E;
		public static const MAT_BUMPMAP: int            = 0xA230;
		public static const MAT_SXP_BUMP_DATA: int      = 0xA324;
		public static const MAT_BUMPMASK: int           = 0xA344;
		public static const MAT_SXP_BUMPMASK_DATA: int  = 0xA330;
		public static const MAT_SPECMAP: int            = 0xA204;
		public static const MAT_SXP_SPEC_DATA: int      = 0xA325;
		public static const MAT_SPECMASK: int           = 0xA348;
		public static const MAT_SXP_SPECMASK_DATA: int  = 0xA332;
		public static const MAT_SHINMAP: int            = 0xA33C;
		public static const MAT_SXP_SHIN_DATA: int      = 0xA326;
		public static const MAT_SHINMASK: int           = 0xA346;
		public static const MAT_SXP_SHINMASK_DATA: int  = 0xA334;
		public static const MAT_SELFIMAP: int           = 0xA33D;
		public static const MAT_SXP_SELFI_DATA: int     = 0xA328;
		public static const MAT_SELFIMASK: int          = 0xA34A;
		public static const MAT_SXP_SELFIMASK_DATA: int = 0xA336;
		public static const MAT_REFLMAP: int            = 0xA220;
		public static const MAT_REFLMASK: int           = 0xA34C;
		public static const MAT_SXP_REFLMASK_DATA: int  = 0xA338;
		public static const MAT_ACUBIC: int             = 0xA310;
		public static const MAT_MAPNAME: int            = 0xA300;
		public static const MAT_MAP_TILING: int         = 0xA351;
		public static const MAT_MAP_TEXBLUR: int        = 0xA353;
		public static const MAT_MAP_USCALE: int         = 0xA354;
		public static const MAT_MAP_VSCALE: int         = 0xA356;
		public static const MAT_MAP_UOFFSET: int        = 0xA358;
		public static const MAT_MAP_VOFFSET: int        = 0xA35A;
		public static const MAT_MAP_ANG: int            = 0xA35C;
		public static const MAT_MAP_COL1: int           = 0xA360;
		public static const MAT_MAP_COL2: int           = 0xA362;
		public static const MAT_MAP_RCOL: int           = 0xA364;
		public static const MAT_MAP_GCOL: int           = 0xA366;
		public static const MAT_MAP_BCOL: int           = 0xA368;
		public static const NAMED_OBJECT: int           = 0x4000;
		public static const N_DIRECT_LIGHT: int         = 0x4600;
		public static const DL_OFF: int                 = 0x4620;
		public static const DL_OUTER_RANGE: int         = 0x465A;
		public static const DL_INNER_RANGE: int         = 0x4659;
		public static const DL_MULTIPLIER: int          = 0x465B;
		public static const DL_EXCLUDE: int             = 0x4654;
		public static const DL_ATTENUATE: int           = 0x4625;
		public static const DL_SPOTLIGHT: int           = 0x4610;
		public static const DL_SPOT_ROLL: int           = 0x4656;
		public static const DL_SHADOWED: int            = 0x4630;
		public static const DL_LOCAL_SHADOW2: int       = 0x4641;
		public static const DL_SEE_CONE: int            = 0x4650;
		public static const DL_SPOT_RECTANGULAR: int    = 0x4651;
		public static const DL_SPOT_ASPECT: int         = 0x4657;
		public static const DL_SPOT_PROJECTOR: int      = 0x4653;
		public static const DL_SPOT_OVERSHOOT: int      = 0x4652;
		public static const DL_RAY_BIAS: int            = 0x4658;
		public static const DL_RAYSHAD: int             = 0x4627;
		public static const N_CAMERA: int               = 0x4700;
		public static const CAM_SEE_CONE: int           = 0x4710;
		public static const CAM_RANGES: int             = 0x4720;
		public static const OBJ_HIDDEN: int             = 0x4010;
		public static const OBJ_VIS_LOFTER: int         = 0x4011;
		public static const OBJ_DOESNT_CAST: int        = 0x4012;
		public static const OBJ_DONT_RCVSHADOW: int     = 0x4017;
		public static const OBJ_MATTE: int              = 0x4013;
		public static const OBJ_FAST: int               = 0x4014;
		public static const OBJ_PROCEDURAL: int         = 0x4015;
		public static const OBJ_FROZEN: int             = 0x4016;
		public static const N_TRI_OBJECT: int           = 0x4100;
		public static const POINT_ARRAY: int            = 0x4110;
		public static const POINT_FLAG_ARRAY: int       = 0x4111;
		public static const FACE_ARRAY: int             = 0x4120;
		public static const MSH_MAT_GROUP: int          = 0x4130;
		public static const SMOOTH_GROUP: int           = 0x4150;
		public static const MSH_BOXMAP: int             = 0x4190;
		public static const TEX_VERTS: int              = 0x4140;
		public static const MESH_MATRIX: int            = 0x4160;
		public static const MESH_COLOR: int             = 0x4165;
		public static const MESH_TEXTURE_INFO: int      = 0x4170;
		public static const KFDATA: int                 = 0xB000;
		public static const KFHDR: int                  = 0xB00A;
		public static const KFSEG: int                  = 0xB008;
		public static const KFCURTIME: int              = 0xB009;
		public static const AMBIENT_NODE_TAG: int       = 0xB001;
		public static const OBJECT_NODE_TAG: int        = 0xB002;
		public static const CAMERA_NODE_TAG: int        = 0xB003;
		public static const TARGET_NODE_TAG: int        = 0xB004;
		public static const LIGHT_NODE_TAG: int         = 0xB005;
		public static const L_TARGET_NODE_TAG: int      = 0xB006;
		public static const SPOTLIGHT_NODE_TAG: int     = 0xB007;
		public static const NODE_ID: int                = 0xB030;
		public static const NODE_HDR: int               = 0xB010;
		public static const PIVOT: int                  = 0xB013;
		public static const INSTANCE_NAME: int          = 0xB011;
		public static const MORPH_SMOOTH: int           = 0xB015;
		public static const BOUNDBOX: int               = 0xB014;
		public static const POS_TRACK_TAG: int          = 0xB020;
		public static const COL_TRACK_TAG: int          = 0xB025;
		public static const ROT_TRACK_TAG: int          = 0xB021;
		public static const SCL_TRACK_TAG: int          = 0xB022;
		public static const MORPH_TRACK_TAG: int        = 0xB026;
		public static const FOV_TRACK_TAG: int          = 0xB023;
		public static const ROLL_TRACK_TAG: int         = 0xB024;
		public static const HOT_TRACK_TAG: int          = 0xB027;
		public static const FALL_TRACK_TAG: int         = 0xB028;
		public static const HIDE_TRACK_TAG: int         = 0xB029;
		public static const POLY_2D: int                = 0x5000;
		public static const SHAPE_OK: int               = 0x5010;
		public static const SHAPE_NOT_OK: int           = 0x5011;
		public static const SHAPE_HOOK: int             = 0x5020;
		public static const PATH_3D: int                = 0x6000;
		public static const PATH_MATRIX: int            = 0x6005;
		public static const SHAPE_2D: int               = 0x6010;
		public static const M_SCALE: int                = 0x6020;
		public static const M_TWIST: int                = 0x6030;
		public static const M_TEETER: int               = 0x6040;
		public static const M_FIT: int                  = 0x6050;
		public static const M_BEVEL: int                = 0x6060;
		public static const XZ_CURVE: int               = 0x6070;
		public static const YZ_CURVE: int               = 0x6080;
		public static const INTERPCT: int               = 0x6090;
		public static const DEFORM_LIMIT: int           = 0x60A0;
		public static const USE_CONTOUR: int            = 0x6100;
		public static const USE_TWEEN: int              = 0x6110;
		public static const USE_SCALE: int              = 0x6120;
		public static const USE_TWIST: int              = 0x6130;
		public static const USE_TEETER: int             = 0x6140;
		public static const USE_FIT: int                = 0x6150;
		public static const USE_BEVEL: int              = 0x6160;
		public static const DEFAULT_VIEW: int           = 0x3000;
		public static const VIEW_TOP: int               = 0x3010;
		public static const VIEW_BOTTOM: int            = 0x3020;
		public static const VIEW_LEFT: int              = 0x3030;
		public static const VIEW_RIGHT: int             = 0x3040;
		public static const VIEW_FRONT: int             = 0x3050;
		public static const VIEW_BACK: int              = 0x3060;
		public static const VIEW_USER: int              = 0x3070;
		public static const VIEW_CAMERA: int            = 0x3080;
		public static const VIEW_WINDOW: int            = 0x3090;
		public static const VIEWPORT_LAYOUT_OLD: int    = 0x7000;
		public static const VIEWPORT_DATA_OLD: int      = 0x7010;
		public static const VIEWPORT_LAYOUT: int        = 0x7001;
		public static const VIEWPORT_DATA: int          = 0x7011;
		public static const VIEWPORT_DATA_3: int        = 0x7012;
		public static const VIEWPORT_SIZE: int          = 0x7020;
		public static const NETWORK_VIEW: int           = 0x7030;
		
		public static const HEAD_SIZE: int = 6;
		
		public var start: int = 0;
		public var next: int = 0;
		public var id: int = 0;
		public var length: int = 0;
		public var content: int = 0;
		public var pos: int = 0;
		
		public function Chunk3DS( ) 
		{
		}
		
		public static function createFromPosition( start: int, id: int, length: int ): Chunk3DS
		{
			var chunk: Chunk3DS = new Chunk3DS();
			chunk.start = start;
			chunk.id = id;
			chunk.length = length;
			chunk.next = ( start + length );
			chunk.content = ( length - HEAD_SIZE );
			chunk.pos = ( start + HEAD_SIZE );
			return chunk;
		}
		
		public static function createFromLength( length: int ): Chunk3DS
		{
			var chunk: Chunk3DS = new Chunk3DS();
			chunk.start = 0;
			chunk.next = length;
			chunk.id = 0;
			chunk.length = length;
			chunk.content = ( length - HEAD_SIZE );
			chunk.pos = 0;
			return chunk;
		}
		
		public function inside(): Boolean
		{
			return ( pos < next );
		}
		
		public function skip( p: int ): void
		{
			this.pos += p;
		}
		
	}

}