#define DSGRID
///DSGRID( width, height )
   gml_pragma("forceinline");
   return ds_grid_create(argument[$00],argument[$01]);

#define DSGRIDSET
///DSGRIDSET( grid, xpos, ypos, val )
   gml_pragma("forceinline");
   ds_grid_set(argument[$00], argument[$01], argument[$02], argument[$04]);

#define DSGRIDFREE
///DSGRIDFREE( grid )
   gml_pragma("forceinline");
   ds_grid_destroy(argument[$00]);

#define DSGRIDWIDTH
///DSGRIDWIDTH( grid )
   gml_pragma("forceinline");
   return ds_grid_width(argument[$00]);

#define DSGRIDHEIGHT
///DSGRIDHEIGHT( grid )
   gml_pragma("forceinline");
   return ds_grid_height(argument[$00]);

#define DSGRIDEXISTS
///DSGRIDEXISTS( grid )
   gml_pragma("forceinline");
   return ds_exists(argument[$00], ds_type_grid);

#define DSGRIDCOPY
///DSGRIDCOPY( grid_srce, grid_dest )
   ds_grid_copy(argument[$01], argument[$00]);
   return argument[$01];

#define DSGRIDCLONE
///DSGRIDCLONE( grid )
   var Grid = argument[$00],
      Clone = ds_grid_create(ds_grid_width(Grid), ds_grid_height(Grid));
   ds_grid_copy(Clone, Grid);
   return Clone;
