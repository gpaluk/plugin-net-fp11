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
	import flash.media.Camera;
	import flash.utils.ByteArray;
	import plugin.net.parsers.max3ds.Reader3DS;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Model3DS 
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
		public var shadow: Shadow3DS;
		
		private var bounds: Box3DS;
		private var vertices: Array = []; // 2d
		private var normals: Array = []; // 2d
		private var indices: int;
		private var fvVertices: ByteArray;
		private var fvNormals: ByteArray;
		
		private var _count: int;
		
		public function Model3DS( source: ByteArray ) 
		{
			var r: Reader3DS = new Reader3DS( source );
			// TODO reader.name etc
			try {
				read( r );
			}
			catch ( e:Error )
			{
				trace( "An error occured" );
			}
		}
		
		public function reset(): void
		{
			bounds = null;
			vertices = null;
			normals = null;
			fvVertices = null;
			fvNormals = null;
			for each( var m: Mesh3DS in mesh )
			{
				m.reset();
			}
		}
		
		public function get bounds(): Box3DS
		{
			var bounds: Box3DS = this.bounds;
			if ( null == bounds )
			{
				bounds: Box3DS = new Box3DS( true );
				this.bounds = bounds;
				for ( var cc: int = 0, _count = mesh.length; cc < _count; ++cc )
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
			return indices; 
		}
		
		
		protected function addMesh( mesh: Mesh3DS ): void
		{
			
		}
		
		protected function addCamera( camera: Camera3DS ): void
		{
			
		}
		
		protected function addMaterial( material: Material3DS ): void
		{
			
		}
		
		protected function addLight( light3DS: Light3DS ): void
		{
			
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
			for ( var:int = 0; i < mesh.length; ++i )
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
		
		public function indexOfCameraByName( name: String ): Camera3DS
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
		
		public function indexOfMaterialByName( name: String ): Material3DS
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
		
		public function indexOfLightByName( name: String ): Light3DS
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
			
		}
		
	}

}