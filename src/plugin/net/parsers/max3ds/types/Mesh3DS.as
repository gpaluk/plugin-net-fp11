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
	import flash.utils.ByteArray;
	import io.plugin.core.interfaces.IDisposable;
	import plugin.net.parsers.max3ds.Chunk3DS;
	import plugin.net.parsers.max3ds.enum.Map3DSType;
	import plugin.net.parsers.max3ds.Reader3DS;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Mesh3DS implements IDisposable
	{
		
		public var name: String;
		public var userId: int;
		public var userPtr: Object;
		public var objectFlags: int;
		public var color: int;
		public var matrix: Array = [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]];
		public var vertices: Array = [];
		public var texcos: Array = [];
		public var vFlags: Array = [];
		public var faces: Array = [];
		public var boxFront: String;
		public var boxBack: String;
		public var boxLeft: String;
		public var boxRight: String;
		public var boxTop: String;
		public var boxBottom: String;
		public var mapType: Map3DSType = Map3DSType.NONE;
		public var mapPos: Array = [ 0, 0, 0 ];
		public var mapMatrix: Array = [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]];
		public var mapScale: Number;
		public var mapTile: Array = [ 0, 0 ];
		public var mapPlanarSize: Array = [ 0, 0 ];
		public var mapCylinderHeight: Number;
		
		public var bounds: Box3DS;
		public var normals:Array = [];
		public var fvVertices: ByteArray;
		public var fvNormals: ByteArray;
		
		public function Mesh3DS( model: Model3DS, r:Reader3DS, cp:Chunk3DS, name:String ) 
		{
			this.name = name;
			read( model, r, cp );
		}
		
		public function dispose(): void
		{
			bounds = null;
			normals = null;
			fvVertices = null;
			fvNormals = null;
		}
		
		public function read( model: Model3DS, r: Reader3DS, cp: Chunk3DS ): void
		{
			var i: int;
			var j: int;
			while ( cp.inside() )
			{
				var cp2: Chunk3DS = r.next( cp );
				switch( cp2.inside() )
				{
					case Chunk3DS.MESH_MATRIX:
							for ( i = 0; i < 4; ++i ) {
								for ( j = 0; j < 3; ++j ) {
									matrix[ i ][ j ] = r.readFloat( cp2 );
								}
							}
						break;
					case Chunk3DS.MESH_COLOR:
							color = r.readU8( cp2 );
						break;
					case Chunk3DS.POINT_ARRAY:
							var count: int = r.readU16( cp2 );
							vertices = Vertex3DS.resizeInt( vertices, count );
							if ( 0 != texcos.length )
							{
								texcos = Vertex3DS.resizeInt( texcos, count );
							}
							if ( 0 != vFlags.length )
							{
								vFlags = Vertex3DS.resizeInt( vFlags, count );
							}
							for ( i = 0; i < count; ++i )
							{
								r.readVector( cp2, vertices[ i ] );
							}
						break;
					case Chunk3DS.POINT_FLAG_ARRAY:
							var nFlags: int = r.readU16( cp2 );
							count = ( vertices.length >= nFlags ) ? vertices.length : nFlags;
							vertices = Vertex3DS.resizeInt( vertices, count );
							if ( 0 != texcos.length )
							{
								texcos = Vertex3DS.resizeInt( texcos, count );
							}
							//TODO check this line
							vFlags = Vertex3DS.resizeInt( vFlags, count );
							for ( i = 0; i < nFlags; ++i )
							{
								vFlags[ i ] = r.readU16( cp2 );
							}
						break;
					case Chunk3DS.FACE_ARRAY:
							var nFaces: int = r.readU16( cp2 );
							faces = Face3DS.createQuantity( nFaces );
							for ( var cc: int = 0; cc < nFaces; ++cc )
							{
								var face: Face3DS = faces[ cc ];
								face.index[ 0 ] = r.readU16( cp2 );
								face.index[ 1 ] = r.readU16( cp2 );
								face.index[ 2 ] = r.readU16( cp2 );
								face.flags.flag = r.readU16( cp2 );
							}
							while ( cp2.inside() )
							{
								var cp3: Chunk3DS = r.next( cp2 );
								switch( cp3.id )
								{
									case Chunk3DS.MSH_MAT_GROUP:
											var name:String = r.readString( cp3 );
											var material: int = model.indexOfMaterialByName( name );
											var n: int = r.readU16( cp3 );
											for ( cc = 0; cc < n; ++cc )
											{
												var index: int = r.readU16( cp3 );
												if ( index < nFaces )
												{
													faces[ index ].material = material;
												}
											}
										break;
									case Chunk3DS.SMOOTH_GROUP:
											for ( i = 0; i < nFaces; ++i )
											{
												faces[ i ].smoothingGroup = r.readS32( cp3 );
											}
										break;
									case Chunk3DS.MSH_BOXMAP:
											boxFront = r.readString(cp3);
											boxBack = r.readString(cp3);
											boxLeft = r.readString(cp3);
											boxRight = r.readString(cp3);
											boxTop = r.readString(cp3);
											boxBottom = r.readString(cp3);
										break;
								}
							}
						break;
					case Chunk3DS.MESH_TEXTURE_INFO:
							//FIXME: this.mapType = r.readU16(cp2);
							
							for ( i = 0; i < 2; ++i )
							{
								mapTile[ i ] = r.readFloat( cp2 );
							}
							for ( i = 0; i < 3; ++i )
							{
								mapPos[ i ] = r.readFloat( cp2 );
							}
							mapScale = r.readFloat( cp2 );
							
							mapMatrix = [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]];
							for ( i = 0; i < 4; ++i )
							{
								for ( j = 0; j < 3; ++j )
								{
									mapMatrix[ i ][ j ] = r.readFloat( cp2 );
								}
							}
							for ( i = 0; i < 2; ++i )
							{
								mapPlanarSize[ i ] = r.readFloat( cp2 );
							}
							
							mapCylinderHeight = r.readFloat( cp2 );
						break;
					case Chunk3DS.TEX_VERTS:
							var nTexcos: int = r.readU16( cp2 );
							count = ( vertices.length >= nTexcos) ? vertices.length  : nTexcos;
							vertices = Vertex3DS.resizeInt( vertices, count );
							texcos = Vertex3DS.resizeInt( texcos, count );
							vFlags = Vertex3DS.resizeInt( vFlags, count );
							for ( cc = 0; cc < nTexcos; ++cc )
							{
								var texcos: Array = this.texcos[ cc ];
								texcos[ 0 ] = r.readFloat( cp2 );
								texcos[ 1 ] = r.readFloat( cp2 );
							}
						break;
					
				}
			}
			
			//TODO matrix determinant
			trace( "WARNING matrix determinant not yet implemented!" );
		}
		
	}

}