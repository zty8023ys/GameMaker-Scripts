#define intersect_rct
///intersect_rct(x,y,x1,y1,x2,y2);
   var x1 , y1 , x2 , y2 , x3 , y3;
   x1 = argument0; y1 = argument1; x2 = argument2;
   y2 = argument3; x3 = argument4; y3 = argument5;
   return ( x1 >= x2 && x1 <= x3 && y1 >= y2 && y1 <= y3 );

#define intersect_cir
///intersect_cir(x,y,x1,y1,r);
   var x1 , y1 , x2 , y2 , r;
   x1 = argument0; y1 = argument1;
   x2 = argument2; y2 = argument3; r = argument4;
   return point_distance( x1 , y1 , x2 , y2 ) <= r;

#define intersect_tri
///intersect_tri(x,y,x1,y1,x2,y2,x3,y3);
   var x1 , y1 , x2 , y2 , x3 , y3 , x4 , y4 , a , b , c;
   x1 = argument0; y1 = argument1; x2 = argument2;
   y2 = argument3; x3 = argument4; y3 = argument5;
   x4 = argument6; y4 = argument7;
   a = ( x2 - x1 ) * ( y3 - y1 ) - ( x3 - x1 ) * ( y2 - y1 );
   b = ( x3 - x1 ) * ( y4 - y1 ) - ( x4 - x1 ) * ( y3 - y1 );
   c = ( x4 - x1 ) * ( y2 - y1 ) - ( x2 - x1 ) * ( y4 - y1 );
   return ( sign( a ) == sign( b ) && sign( b ) == sign( c ) );

#define intersect_qdr
///intersect_qdr(x,y,x1,y1,x2,y2,x3,y3,x4,y4);
   var a , b , c , d;
   a = ( argument8 - argument0 ) * ( argument3 - argument1 ) - ( argument2 - argument0 ) * ( argument9 - argument1 );
   b = ( argument2 - argument0 ) * ( argument5 - argument1 ) - ( argument4 - argument0 ) * ( argument3 - argument1 );
   c = ( argument4 - argument0 ) * ( argument7 - argument1 ) - ( argument6 - argument0 ) * ( argument5 - argument1 );
   d = ( argument6 - argument0 ) * ( argument9 - argument1 ) - ( argument8 - argument0 ) * ( argument7 - argument1 );
   return ( sign( a ) == sign( b ) && sign( b ) == sign( c ) && sign( c ) == sign( d ) );

#define intersect_pnt
///intersect_pnt(x,y,x1,y1,x2,y2,x3,y3,x4,y4,x5,y5);
   var a , b , c , d , e;
   a = ( argument10 - argument0 ) * ( argument3 - argument1 ) - ( argument2 - argument0 ) * ( argument11 - argument1 );
   b = ( argument2 - argument0 ) * ( argument5 - argument1 ) - ( argument4 - argument0 ) * ( argument3 - argument1 );
   c = ( argument4 - argument0 ) * ( argument7 - argument1 ) - ( argument6 - argument0 ) * ( argument5 - argument1 );
   d = ( argument6 - argument0 ) * ( argument9 - argument1 ) - ( argument8 - argument0 ) * ( argument7 - argument1 );
   e = ( argument8 - argument0 ) * ( argument11 - argument1 ) - ( argument10 - argument0 ) * ( argument9 - argument1 );
   return ( sign( a ) == sign( b ) && sign( b ) == sign( c ) && sign( c ) == sign( d ) && sign( d ) == sign( e ) );

#define intersect_hex
///intersect_hex(x,y,x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6);
   var a , b , c , d , e , f;
   a = ( argument12 - argument0 ) * ( argument3 - argument1 ) - ( argument2 - argument0 ) * ( argument13 - argument1 );
   b = ( argument2 - argument0 ) * ( argument5 - argument1 ) - ( argument4 - argument0 ) * ( argument3 - argument1 );
   c = ( argument4 - argument0 ) * ( argument7 - argument1 ) - ( argument6 - argument0 ) * ( argument5 - argument1 );
   d = ( argument6 - argument0 ) * ( argument9 - argument1 ) - ( argument8 - argument0 ) * ( argument7 - argument1 );
   e = ( argument8 - argument0 ) * ( argument11 - argument1 ) - ( argument10 - argument0 ) * ( argument9 - argument1 );
   f = ( argument10 - argument0 ) * ( argument13 - argument1 ) - ( argument12 - argument0 ) * ( argument11 - argument1 );
   return ( sign( a ) == sign( b ) && sign( b ) == sign( c ) && sign( c ) == sign( d ) && sign( d ) == sign( e ) && sign( e ) == sign( f ) );

#define intersect_hpt
///intersect_hpt(x,y,x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7);
   var a , b , c , d , e , f , g;
   a = ( argument14 - argument0 ) * ( argument3 - argument1 ) - ( argument2 - argument0 ) * ( argument15 - argument1 );
   b = ( argument2 - argument0 ) * ( argument5 - argument1 ) - ( argument4 - argument0 ) * ( argument3 - argument1 );
   c = ( argument4 - argument0 ) * ( argument7 - argument1 ) - ( argument6 - argument0 ) * ( argument5 - argument1 );
   d = ( argument6 - argument0 ) * ( argument9 - argument1 ) - ( argument8 - argument0 ) * ( argument7 - argument1 );
   e = ( argument8 - argument0 ) * ( argument11 - argument1 ) - ( argument10 - argument0 ) * ( argument9 - argument1 );
   f = ( argument10 - argument0 ) * ( argument13 - argument1 ) - ( argument12 - argument0 ) * ( argument11 - argument1 );
   g = ( argument12 - argument0 ) * ( argument15 - argument1 ) - ( argument14 - argument0 ) * ( argument13 - argument1 );
   return (sign( a ) == sign( b ) && sign( b ) == sign( c ) && sign( c ) == sign( d ) && sign( d ) == sign( e ) && sign( e ) == sign( f ) );

#define intersect_lne
///intersect_lne(x,y,x1,y1,x2,y2);
   var x1 , y1 , x2 , y2 , x3 , y3 , a , b;
   x1 = argument0;
   y1 = argument1;
   x2 = argument2;
   y2 = argument3;
   x3 = argument4;
   y3 = argument5;
   a = ( x2 - x1 ) * ( y2 - y1 ) - ( x3 - x1 ) * ( y3 - y1 );
   b = ( x3 - x1 ) * ( y3 - y1 ) - ( x2 - x1 ) * ( y2 - y1 );
   return ( sign( a ) == sign( b ) );
   
#define intersect_ply
   /// point_in_polygon(x,y,polygon)
   //
   //  Returns true if the given test point is inside 
   //  the given 2D polygon, false otherwise.
   //
   //      x,y         coordinates of the test point
   //      polygon     ds_list of an ordered series of coordinate 
   //                  pairs defining the shape of a polygon
   //
   //  Polygons are closed figures with edges spanning consecutive
   //  vertices and from the last vertex to the first.
   //
   /// GMLscripts.com/license
   var x0, y0, polygon, inside;
   var n, i, polyX, polyY, x1, y1, x2, y2;
   x0 = argument0;
   y0 = argument1;
   polygon = argument2;
   inside = false;
   n = ds_list_size(polygon) div 2;
   
   for (i=0; i<n; i+=1) {
      polyX[i] = ds_list_find_value(polygon, 2*i);
      polyY[i] = ds_list_find_value(polygon, 2*i+1);
   }
   
   polyX[n] = polyX[0];
   polyY[n] = polyY[0];
   
   for (i=0; i<n; i+=1) {
      x1 = polyX[i];
      y1 = polyY[i];
      x2 = polyX[i+1];
      y2 = polyY[i+1];
     
      if ((y2 > y0) != (y1 > y0)) {
         inside ^= (x0 < (x1-x2) * (y0-y2) / (y1-y2) + x2);
      }       
   }
   
   return inside;

#define ray_intersect_ray
///ray_intersect_ray(x1,y1,x2,y2,x3,y3,x4,y4);
   var a , b;
   a = sign( argument2 - argument0 ) - sign( argument3 - argument1 );
   b = sign( argument6 - argument4 ) - sign( argument7 - argument5 );
   return ( ( a > b ) * 1 ) + ( ( a == b ) * 0 ) + ( ( a < b ) * 1 );
