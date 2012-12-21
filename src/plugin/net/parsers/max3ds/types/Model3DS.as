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
	import flash.media.Camera;
	import flash.utils.ByteArray;
	import io.plugin.core.interfaces.IDisposable;
	import plugin.net.parsers.max3ds.Chunk3DS;
	import plugin.net.parsers.max3ds.enum.Node3DSType;
	import plugin.net.parsers.max3ds.errors.Parser3DSError;
	import plugin.net.parsers.max3ds.Reader3DS;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Model3DS implements IDisposable
	{
		
		public var name: String;
		public var mesh: Array = [];
		public var camera: Array = [];
		public var material: Array = [];
		public var light: Array = [];
		public var constructionPlane: Array = Vertex3DS.create();
		public var ambient: Array = Color3DS.create();
		public var meshVersion: int;
		public var masterScale: Number;
		public var segmentFrom: int;
		public var segmentTo: int;
		public var keyfRevision: int;
		public var frames: int;
		public var currentFrame: int;
		public var nodes: Node3DS;
		public var last: Node3DS;
		public var background: Background3DS;
		public var atmosphere: Atmosphere3DS;
		public var viewport: Viewport3DS;
		public var shadow: Shadow3DS;
		
		private var _bounds: Box3DS;
		private var _vertices: Array = []; // 2d
		private var _normals: Array = []; // 2d
		private var _indices: int;
		private var _fvVertices: ByteArray;
		private var _fvNormals: ByteArray;
		
		private var _count: int;
		
		public function Model3DS( name: String, source: ByteArray ) 
		{
			this.name = name;
			
			var r: Reader3DS = new Reader3DS( name, source );
			try {
				read( r );
			}
			catch ( e: Error )
			{
				trace( "An error occured" );
			}
		}
		
		public function dispose(): void
		{
			_bounds = null;
			_vertices = null;
			_normals = null;
			_fvVertices = null;
			_fvNormals = null;
			for each( var m: Mesh3DS in mesh )
			{
				m.dispose();
			}
		}
		
		public function get bounds(): Box3DS
		{
			var bounds: Box3DS = _bounds;
			if ( null == bounds )
			{
				bounds = new Box3DS( true );
				_bounds = bounds;
				for ( var cc: int = 0, _count: int = mesh.length; cc < _count; ++cc )
				{
					var m: Mesh3DS = mesh[ cc ];
					var mb: Box3DS = m.bounds;
					//TODO min/max
					
				}
			}
			return bounds;
		}
		
		public function get indices(): int
		{
			return _indices; 
		}
		
		
		protected function addMesh( mesh: Mesh3DS ): void
		{
			this.mesh.push( mesh );
		}
		
		protected function addCamera( camera: Camera3DS ): void
		{
			this.camera.push( camera );
		}
		
		protected function addMaterial( material: Material3DS ): void
		{
			this.material.push( material );
		}
		
		protected function addLight( light3DS: Light3DS ): void
		{
			this.light.push( light3DS );
		}
		
		public function get numMesh(): int
		{
			return this.mesh.length;
		}
		
		public function hasMeshAt( index: int ): Boolean
		{
			return ( 0 <= index && index < mesh.length );
		}
		
		public function getMeshAt( index: int ): Mesh3DS
		{
			if ( 0 <= index && index < mesh.length )
			{
				return mesh[ index ];
			}
			throw new Error( "Index out of bounds." );
		}
		
		public function get firstMesh(): Mesh3DS
		{
			if ( mesh.length > 0 )
			{
				return mesh[ 0 ];
			}
			throw new Error( "There is no mesh available." );
		}
		
		public function getMeshByName( name: String ): Mesh3DS
		{
			for each( var m: Mesh3DS in mesh )
			{
				if ( name == m.name )
				{
					return m;
				}
			}
			throw new Error( "Mesh not found with name: " + name + "." );
		}
		
		public function indexOfMeshByName( name: String ): int
		{
			for ( var i: int = 0; i < mesh.length; ++i )
			{
				if ( mesh[ i ].name == name )
				{
					return i;
				}
			}
			return -1;
		}
		
		public function get numCamera(): int
		{
			return camera.length;
		}
		
		public function hasCameraAt( index: int ): Boolean
		{
			return( 0 <= index && index < camera.length );
		}
		
		public function getCameraAt( index: int ): Camera3DS
		{
			if ( 0 <= index && index < camera.length )
			{
				return camera[ index ];
			}
			throw new Error( "Index out of bounds." );
		}
		
		public function get firstCamera(): Camera3DS
		{
			if ( camera.length > 0 )
			{
				return camera[ 0 ];
			}
			throw new Error( "There is no camera available." );
		}
		
		public function getCameraByName( name: String ): Camera3DS
		{
			for each( var c: Camera3DS in camera )
			{
				if ( c.name == name )
				{
					return c;
				}
			}
			throw new Error( "Camera not found with name: " + name + "." );
		}
		
		public function indexOfCameraByName( name: String ): int
		{
			for ( var i: int = 0; i < camera.length; ++i )
			{
				if ( camera[ i ].name == name )
				{
					return i;
				}
			}
			return -1;
		}
		
		
		
		public function get numMaterial(): int
		{
			return material.length;
		}
		
		public function hasMaterialAt( index: int ): Boolean
		{
			return ( 0 <= index && index < material.length );
		}
		
		public function getMaterialAt( index: int ): Material3DS
		{
			if ( 0 <= index && index < material.length )
			{
				return material[ index ];
			}
			throw new Error( "Index out of bounds." );
		}
		
		public function firstMaterial(): Material3DS
		{
			if ( material.length > 0 )
			{
				return material[ 0 ];
			}
			throw new Error( "There is no material available." );
		}
		
		public function getMaterialByName( name: String ): Material3DS
		{
			for each( var m: Material3DS in material )
			{
				if ( m.name == name )
				{
					return m;
				}
			}
			throw new Error( "Material not found with name: " + name + "." );
		}
		
		public function indexOfMaterialByName( name: String ): int
		{
			for ( var i: int = 0; i < material.length; ++i )
			{
				if ( material[ i ].name == name )
				{
					return i;
				}
			}
			return -1;
		}
		
		public function get numLight(): int
		{
			return light.length;
		}
		
		public function hasLightAt( index: int ): Boolean
		{
			return ( 0 <= index && index < light.length );
		}
		
		public function getLightAt( index: int ): Light3DS
		{
			if ( 0 <= index && index < light.length )
			{
				return light[ index ];
			}
			throw new Error( "Index out of bounds." );
		}
		
		public function get firstLight(): Light3DS
		{
			if ( light.length > 0 )
			{
				return light[ 0 ];
			}
			throw new Error( "There is no light available." );
		}
		
		public function getLightByName( name: String ): Light3DS
		{
			for each( var l: Light3DS in light )
			{
				if ( l.name == name )
				{
					return l;
				}
			}
			throw new Error( "Light not found with name: " + name + "." );
		}
		
		public function indexOfLightByName( name: String ): int
		{
			for ( var i: int = 0; i < light.length; ++i )
			{
				if ( light[ i ].name == name )
				{
					return i;
				}
			}
			return -1;
		}
		
		//TODO node list (collection framework)
		
		
		public function read( r: Reader3DS ): void
		{
			var cp0: Chunk3DS = r.start();
			if ( cp0.id == Chunk3DS.M3DMAGIC )
			{
				while ( cp0.inside() )
				{
					var cp1: Chunk3DS = r.next( cp0 );
					switch( cp1.id )
					{
						case Chunk3DS.MDATA:
								var cp2: Chunk3DS = r.next( cp1 );
								switch( cp2.id )
								{
									case Chunk3DS.MESH_VERSION:
											meshVersion = r.readS32( cp2 );
										break;
									case Chunk3DS.MASTER_SCALE:
											masterScale = r.readFloat( cp2 );
										break;
									case Chunk3DS.SHADOW_MAP_SIZE:
									case Chunk3DS.LO_SHADOW_BIAS:
									case Chunk3DS.HI_SHADOW_BIAS:
									case Chunk3DS.SHADOW_SAMPLES:
									case Chunk3DS.SHADOW_RANGE:
									case Chunk3DS.SHADOW_FILTER:
									case Chunk3DS.RAY_BIAS:
											shadow = new Shadow3DS( this, r, cp2 );
										break;
									case Chunk3DS.VIEWPORT_LAYOUT:
									case Chunk3DS.DEFAULT_VIEW:
											viewport = new Viewport3DS( this, r, cp2 );
										break;
									case Chunk3DS.O_CONSTS:
											r.readVector( cp2, constructionPlane );
										break;
									case Chunk3DS.AMBIENT_LIGHT:
										var lin: Boolean = false;
										while ( cp2.inside() )
										{
											var cp3: Chunk3DS = r.next( cp2 );
											switch( cp3.id )
											{
												case Chunk3DS.LIN_COLOR_F:
														lin = true;
														r.readVector( cp3, ambient );
													break;
												case Chunk3DS.COLOR_F:
														if ( !lin )
														{
															r.readVector( cp3, ambient );
														}
													break;
											}
										}
										break;
									case Chunk3DS.BIT_MAP:
									case Chunk3DS.SOLID_BGND:
									case Chunk3DS.V_GRADIENT:
									case Chunk3DS.USE_BIT_MAP:
									case Chunk3DS.USE_SOLID_BGND:
									case Chunk3DS.USE_V_GRADIENT:
											background = new Background3DS( this, r, cp2 );
										break;
									case Chunk3DS.FOG:
									case Chunk3DS.LAYER_FOG:
									case Chunk3DS.DISTANCE_CUE:
									case Chunk3DS.USE_FOG:
									case Chunk3DS.USE_LAYER_FOG:
									case Chunk3DS.USE_DISTANCE_CUE:
											atmosphere = new Atmosphere3DS( this, r, cp2 );
										break;
									case Chunk3DS.MAT_ENTRY:
											addMaterial( new Material3DS( this, r, cp2 ) );
										break;
									case Chunk3DS.NAMED_OBJECT:
											var name: String = r.readString( cp2 );
											while ( cp2.inside() )
											{
												switch( cp3.id )
												{
													case Chunk3DS.N_TRI_OBJECT:
															addMesh( new Mesh3DS( this, r, cp3, name ));
														break;
													case Chunk3DS.N_CAMERA:
															addCamera( new Camera3DS( this, r, cp3, name ));
														break;
												}
											}
										break;
								}
							break;
						case Chunk3DS.KFDATA:
								var numNodes: int = 0;
								while ( cp1.inside() )
								{
									cp2 = r.next( cp1 );
									switch( cp2.id )
									{
										case Chunk3DS.KFHDR:
												keyfRevision = r.readU16( cp2 );
												name = r.readString( cp2 );
												frames = r.readS32( cp2 );
											break;
										case Chunk3DS.KFSEG:
												segmentFrom = r.readS32( cp2 );
												segmentTo = r.readS32( cp2 );
											break;
										case Chunk3DS.KFCURTIME:
												currentFrame = r.readS32( cp2 );
											break;
										case Chunk3DS.VIEWPORT_LAYOUT:
										case Chunk3DS.DEFAULT_VIEW:
												viewport = new Viewport3DS( this, r, cp2 );
											break;
										case Chunk3DS.AMBIENT_NODE_TAG:
										case Chunk3DS.OBJECT_NODE_TAG:
										case Chunk3DS.CAMERA_NODE_TAG:
										case Chunk3DS.TARGET_NODE_TAG:
										case Chunk3DS.LIGHT_NODE_TAG:
										case Chunk3DS.SPOTLIGHT_NODE_TAG:
										case Chunk3DS.L_TARGET_NODE_TAG:
												var node: Node3DS;
												switch( cp2.id )
												{
													case Chunk3DS.AMBIENT_NODE_TAG:
															node = new AmbientColorNode3DS();
														break;
													case Chunk3DS.OBJECT_NODE_TAG:
															node = new MeshInstanceNode3DS();
														break;
													case Chunk3DS.CAMERA_NODE_TAG:
															node = new CameraNode3DS();
														break;
													case Chunk3DS.TARGET_NODE_TAG:
															node = new TargetNode3DS( Node3DSType.CAMERA_TARGET );
														break;
													case Chunk3DS.LIGHT_NODE_TAG:
															node = new OmnilightNode3DS();
														break;
													case Chunk3DS.SPOTLIGHT_NODE_TAG:
															node = new SpotlightNode3DS();
														break;
													case Chunk3DS.L_TARGET_NODE_TAG:
															node = new TargetNode3DS( Node3DSType.SPOTLIGHT_TARGET );
														break;
													default:
															throw new Parser3DSError();
														break;
												}
												node.nodeId = numNodes++;
												if ( null == last )
												{
													last.next = node;
												}
												else
												{
													nodes = node;
												}
												node.userPtr = last;
												last = node;
												
												node.read( this, r, cp2 );
											break;
										
									}
								}
								
								/**/
								// TODO bubble sort use array (necessary?)
								
							break;
					}
				}
			}
			else
			{
				throw new Parser3DSError( "Bad header (magic) not a 3DS file." );
			}
		}
		
		//TODO clone
		
	}

}