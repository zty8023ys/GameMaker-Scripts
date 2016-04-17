#define ScrIntersectRct
///ScrIntersectRct(x,y,x1,y1,x2,y2);
   var x1 , y1 , x2 , y2 , x3 , y3;
   x1 = argument0; y1 = argument1; x2 = argument2;
   y2 = argument3; x3 = argument4; y3 = argument5;
   return (x1 >= x2 && x1 <= x3 && y1 >= y2 && y1 <= y3);

#define ScrIntersectCir
///ScrIntersectCir(x,y,x1,y1,r);
   var x1 , y1 , x2 , y2 , r;
   x1 = argument0; y1 = argument1;
   x2 = argument2; y2 = argument3; r = argument4;
   return point_distance( x1, y1, x2, y2) <= r;

#define ScrIntersectTri
///ScrIntersectTri(x,y,x1,y1,x2,y2,x3,y3);
   var x1 , y1 , x2 , y2 , x3 , y3 , x4 , y4 , a , b , c;
   x1 = argument0; y1 = argument1; x2 = argument2;
   y2 = argument3; x3 = argument4; y3 = argument5;
   x4 = argument6; y4 = argument7;
   a = ( x2 - x1 ) * ( y3 - y1 ) - ( x3 - x1 ) * (y2 - y1);
   b = ( x3 - x1 ) * ( y4 - y1 ) - ( x4 - x1 ) * (y3 - y1);
   c = ( x4 - x1 ) * ( y2 - y1 ) - ( x2 - x1 ) * (y4 - y1);
   return ( sign(a) == sign(b) && sign(b) == sign(c));

#define ScrIntersectLne
///ScrIntersectLne(x,y,x1,y1,x2,y2);
   var x1 , y1 , x2 , y2 , x3 , y3 , a , b;
   x1 = argument0;
   y1 = argument1;
   x2 = argument2;
   y2 = argument3;
   x3 = argument4;
   y3 = argument5;
   a = (x2 - x1) * (y2 - y1) - (x3 - x1) * (y3 - y1);
   b = (x3 - x1) * (y3 - y1) - (x2 - x1) * (y2 - y1);
   return ( sign( a ) == sign( b ) );
   
#define ScrIntersectPly
   /// ScrIntersectPly(x,y,polygon)
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

#define ScrRayIntersectRay
///ScrRayIntersectRay(x1,y1,x2,y2,x3,y3,x4,y4);
   var a , b;
   a = sign(argument2 - argument0) - sign(argument3 - argument1);
   b = sign(argument6 - argument4) - sign(argument7 - argument5);
   return ((a > b) * 1) + ((a == b) * 0) + ((a < b) * 1);
