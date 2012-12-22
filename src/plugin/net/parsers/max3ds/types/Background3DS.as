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
	import io.plugin.core.errors.CloneNotSupportedError;
	import io.plugin.core.interfaces.ICloneable;
	import plugin.net.parsers.max3ds.Chunk3DS;
	import plugin.net.parsers.max3ds.Reader3DS;
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Background3DS implements ICloneable
	{
		
		public var useBitmap: Boolean = false;
		public var bitmapName: String = "";
		public var useSolid: Boolean = false;
		public var solidColor: Array = Color3DS.create();
		public var useGradient: Boolean = false;
		public var gradientPercent: Number = 0;
		public var gradientTop: Array = Color3DS.create();
		public var gradientMiddle: Array = Color3DS.create();
		public var gradientBottom: Array = Color3DS.create();
		
		public function Background3DS( model: Model3DS, r:Reader3DS, cp: Chunk3DS ) 
		{
			read( model, r, cp );
		}
		
		public function read( model: Model3DS, r: Reader3DS, cp: Chunk3DS ): void
		{
			var cp1: Chunk3DS = r.next( cp );
			var cp2: Chunk3DS;
			
			switch( cp1.id )
			{
				case Chunk3DS.BIT_MAP:
						bitmapName = r.readString( cp1 );
					break;
				case Chunk3DS.SOLID_BGND:
						var lin0: Boolean = false;
						while ( cp1.inside() )
						{
							cp2 = r.next( cp1 );
							switch( cp2.id )
							{
								case Chunk3DS.LIN_COLOR_F:
										r.readColor( cp2, solidColor );
										lin0 = true;
									break;
								case Chunk3DS.COLOR_F:
										//TODO if(!lin0)...
										r.readColor( cp2, solidColor );
									break;
							}
						}
					break;
				case Chunk3DS.V_GRADIENT:
						var index: Array = [ 0, 0 ];
						var col: Array = [];
						var lin1: int = 0;
						gradientPercent = r.readFloat( cp1 );
						
						var dim1: int;
						var dim2: int;
						var dim3: int;
						for ( dim1 = 0; dim1 < 2; ++dim1 )
						{
							col[ dim1 ] = [];
							for ( dim2 = 0; dim2 < 3; ++dim2 )
							{
								col[ dim1 ][ dim2 ] = [];
								for ( dim3 = 0; dim3 < 3; ++dim3 )
								{
									col[ dim1 ][ dim2 ][ dim3 ] = 0;
								}
							}
						}
						
						while ( cp1.inside() )
						{
							cp2 = r.next( cp1 );
							switch( cp2.id )
							{
								case Chunk3DS.COLOR_F:
										r.readColor( cp2, col[ 0 ][ index[ 0 ]] );
										index[ 0 ]++;
									break;
								case Chunk3DS.LIN_COLOR_F:
										r.readColor( cp2, col[ 1 ][ index[ 1 ]] );
										index[ 1 ]++;
										lin1 = 1;
									break;
							}
						}
						for ( var i: int = 0; i < 3; ++i )
						{
							gradientTop[ i ] = col[ lin1 ][ 0 ][ i ];
							gradientMiddle[ i ] = col[ lin1 ][ 1 ][ i ];
							gradientBottom[ i ] = col[ lin1 ][ 2 ][ i ];
						}
					break;
				case Chunk3DS.USE_BIT_MAP:
						useBitmap = true;
					break;
				case Chunk3DS.USE_SOLID_BGND:
						useSolid = true;
					break;
				case Chunk3DS.USE_V_GRADIENT:
						useGradient = true;
					break;
			}
		}
		
		//TODO clone
		public function clone(): *
		{
			throw new CloneNotSupportedError();
		}
		
	}

}