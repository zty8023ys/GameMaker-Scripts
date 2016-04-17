###A collection of point-to-shape intersection scripts.

--
#####ScrIntersectRct(x,y,x1,y1,x2,y2)
Returns whether the point `x,y` intersects the rectangle `x1,y1,x2,y2`.

--
#####ScrIntersectCir(x,y,x1,y1,rad)
Returns whether the point `x,y` intersects the circle `x1,y1,r`

--
#####ScrIntersectTri(x,y,x1,y1,x2,y2,x3,y3)
Returns whether the point `x,y` intersects the triangle `x1,y1,x2,y2,x3,y3`

--
#####ScrIntersectLne(x,y,x1,y1,x2,y2)
Returns whether the point `x,y` is intersects the line `x1,y1,x2,y2`.

--
#####ScrIntersectPly(x,y,polygon)
Returns whether the point `x,y` intersects the given polygon(`ds-list of points`).
