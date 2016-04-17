#define DSLIST
///DSLIST( value,... )
   for(var i = $01; i < argument_count; i ++)
      ds_list_add(argument[$00], argument[i]);
   
   return argument[$00];

#define DSLISTCLEAR
///DSLIST( value,... )
   gml_pragma("forceinline");
   ds_list_clear(argument[$00]);

#define DSLISTADD
///DSLISTADD( list, value, ... )
   for(var i = $01; i < argument_count; i ++)
      ds_list_add(argument[$00], argument[i]);

#define DSLISTSET
///DSLISTADD( list, value )
   ds_list_add(argument[$00], argument[$01]);

#define DSLISTREMOVE
///DSLISTREMOVE( list, ind )
   ds_list_delete(argument[$00], argument[$01]);

#define DSLISTFIND
///DSLISTFIND( list, pos )
   gml_pragma("forceinline");
   return ds_list_find_value(argument[$00], argument[$01]);

#define DSLISTFINDPOS
///DSLISTFINDPOS( list, value )
   gml_pragma("forceinline");
   return ds_list_find_index(argument[$00], argument[$01]);

#define DSLISTFREE
///DSLISTFREE( list )
   gml_pragma("forceinline");
   ds_list_destroy(argument[$00]);

#define DSLISTSIZE
///DSLISTFREE( list )
   gml_pragma("forceinline");
   return ds_list_size(argument[$00]);

#define DSLISTEXISTS
///DSLISTEXISTS( list )
   gml_pragma("forceinline");
   return ds_exists(argument[$00], ds_type_list);

#define DSLISTEMPTY
///DSLISTEMPTY( list )
   gml_pragma("forceinline");
   return ds_list_empty(argument[$00]);

#define DSLISTCOPY
///DSLISTCOPY( list_srce, list_dest )
   gml_pragma("forceinline");
   ds_list_copy(argument[$01],argument[$00]);
   return argument[$01];

#define DSLISTCLONE
///DSLISTCLONE( srce )
   var List = argument[$00],
      Clone = ds_list_create();
   ds_list_copy(Clone,argument[$00]);
   return Clone;
