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
	import io.plugin.core.interfaces.IComparable;
	import plugin.net.parsers.max3ds.Chunk3DS;
	import plugin.net.parsers.max3ds.enum.Node3DSType;
	import plugin.net.parsers.max3ds.Reader3DS;
	
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Node3DS implements IComparable
	{
		
		public var type: Node3DSType;
		public var userId: int = 65535;
		public var userPtr: Object;
		public var next: Node3DS;
		public var childs: Node3DS;
		public var parent: Node3DS;
		public var nodeId: int = 65535;
		public var name: String;
		public var flags: int;
		public var matrix: Array = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]];
		
		public function Node3DS( type: Node3DSType ) 
		{
			this.type = type;
		}
		
		public function read( model:Model3DS, r: Reader3DS, cp: Chunk3DS ): void
		{
			while ( cp.inside() )
			{
				var cp1: Chunk3DS = r.next( cp );
				switch( cp1.id )
				{
					case Chunk3DS.NODE_ID:
							nodeId = r.readU16( cp1 );
						break;
					case Chunk3DS.NODE_HDR:
							name = r.readString( cp1 );
							flags = r.readU16( cp1 );
							flags |= (r.readU16( cp1 ) << 16 );
							userId = r.readU16( cp1 );
						break;
					case Chunk3DS.PIVOT:
							if ( type is Node3DSType.MESH_INSTANCE )
							{
								var n:MeshInstanceNode3DS = MeshInstanceNode3DS( this );
								r.readVector(cp1, n.pivot );
							}
						break;
					case Chunk3DS.INSTANCE_NAME:
							if ( type is Node3DSType.MESH_INSTANCE )
							{
								var n: MeshInstanceNode3DS = MeshInstanceNode3DS( this );
								n.instanceName = r.readString( cp1 );
							}
						break;
					case Chunk3DS.BOUNDBOX:
							if ( type is Node3DSType.MESH_INSTANCE )
							{
								var n: MeshInstanceNode3DS = MeshInstanceNode3DS( this );
								r.readVector( cp1, n.bBoxMin );
								r.readVector( cp1, b.bBoxMax );
							}
						break;
					case Chunk3DS.COL_TRACK_TAG:
							var track: Track3DS = null;
							switch( type )
							{
								case Node3DSType.AMBIENT_COLOR:
										var n: AmbientColorNode3DS = AmbientColorNode3DS( this );
										track = n.colorTrack;
									break;
								case Node3DSType.OMNILIGHT.type:
										var n: OmnilightNode3DS = OmnilightNode3DS( this );
										track = n.colorTrack;
									break;
								case Node3DSType.SPOTLIGHT.type:
										var n: SpotlightNode3DS = SpotlightNode3DS( this );
										track = n.colorTrack;
									break;
							}
							if ( null != track )
							{
								track.read( model, r, cp1 );
							}
						break;
					case Chunk3DS.POS_TRACK_TAG:
							var track: Track3DS = null;
							switch( type )
							{
								case Node3DSType.MESH_INSTANCE:
										var n: MeshInstanceNode3DS = MeshInstanceNode3DS( this );
										track = n.posTrack;
									break;
								case Node3DSType.CAMERA:
										var n: CameraNode3DS = CameraNode3DS( this );
										track = n.posTrack;
									break;
								case Node3DSType.CAMERA_TARGET:
										var n: TargetNode3DS = TargetNode3DS( this );
										track = n.posTrack;
									break;
								case Node3DSType.OMNILIGHT:
										var n: OmnilightNode3DS = OmnilightNode3DS( this );
										track = n.posTrack;
									break;
								case Node3DSType.SPOTLIGHT:
										var n: SpotlightNode3DS = SpotlightNode3DS( this );
										track = n.posTrack;
									break;
								case Node3DSType.SPOTLIGHT_TARGET:
										var n: TargetNode3DS = TargetNode3DS( this );
										track = n.posTrack;
									break;
							}
							if ( null != track )
							{
								track.read( model, r, cp1 );
							}
						break;
					case Chunk3DS.ROT_TRACK_TAG:
							if( type == Node3DSType.MESH_INSTANCE )
							{
								var n: MeshInstanceNode3DS = MeshInstanceNode3DS( this );
								n.rotTrack.read( model, t, cp1 );
							}
						break;
					case Chunk3DS.SCL_TRACK_TAG:
							if( type == Node3DSType.MESH_INSTANCE )
							{
								var n: MeshInstanceNode3DS = MeshInstanceNode3DS( this );
								n.sclTrack.read( model, t, cp1 );
							}
						break;
					case Chunk3DS.FOV_TRACK_TAG:
							if( type == Node3DSType.CAMERA )
							{
								var n: CameraNode3DS = CameraNode3DS( this );
								n.fovTrack.read( model, t, cp1 );
							}
						break;
					case Chunk3DS.HOT_TRACK_TAG:
							if( type == Node3DSType.SPOTLIGHT )
							{
								var n: SpotlightNode3DS = SpotlightNode3DS( this );
								n.hotspotTrack.read( model, r, cp1 );
							}
						break;
					case Chunk3DS.FALL_TRACK_TAG:
							if ( type == Node3DSType.SPOTLIGHT )
							{
								var n: SpotlightNode3DS = SpotlightNode3DS( this );
								n.falloffTrack.read( model, r, cp1 );
							}
						break;
					case Chunk3DS.ROLL_TRACK_TAG:
							switch( type )
							{
								case Node3DSType.CAMERA:
										var n: CameraNode3DS = CameraNode3DS( this );
										n.rollTrack.read( model, r, cp1 );
									break;
								case Node3DSType.SPOTLIGHT:
										var n: SpotlightNode3DS = SpotlightNode3DS( this );
										n.rollTrack.read( model, r, cp1 );
									break;
							}
						break;
					case Chunk3DS.HIDE_TRACK_TAG:
							if ( type == Node3DSType.MESH_INSTANCE )
							{
								var n: MeshInstanceNode3DS = MeshInstanceNode3DS( this );
								n.hideTrack.read( model, r, cp1 );
							}
						break;
					case Chunk3DS.MORPH_SMOOTH:
							if ( type == Node3DSType.MESH_INSTANCE )
							{
								var n: MeshInstanceNode3DS = MeshInstanceNode3DS( this );
								n.morphSmooth.read( model, r, cp1 );
							}
						break;
				}
			}
		}
		
		public final function compareTo( o: Object ): int
		{
			if ( !(o is Node3DS) )
			{
				throw new Error( "An error occured in Node3DS::compareTo(). Object type mismatch." );
			}
			
			var node: Node3DS = o as Node3DS;
			if ( nodeId == node.nodeId )
			{
				return 0;
			}
			else if( nodeId < node.nodeId )
			{
				return -1;
			}
			else
			{
				return 1;
			}
		}
	}
}