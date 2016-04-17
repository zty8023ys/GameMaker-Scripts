#define DSMAP
///DSMAP()
   gml_pragma("forceinline");
   return ds_map_create();

#define DSMAPSET
///DSMAPSET(map, key, val)
   gml_pragma("forceinline");
   ds_map_add(argument[$00], argument[$01], argument[$02]);

#define DSMAPREMOVE
///DSMAPREMOVE(map, key)
   gml_pragma("forceinline");
   ds_map_delete(argument[$00], argument[$01]);

#define DSMAPFIND
///DSMAPFIND( map, key )
   gml_pragma("forceinline");
   return ds_map_find_value(argument[$00], argument[$01]);

#define DSMAPFREE
///DSMAPFREE( map )
   gml_pragma("forceinline");
   ds_map_destroy(argument[$00]);

#define DSMAPKEYLIST
///DSMAPKEYLIST( map )
   var Map = argument[$00],
      KeyList = ds_list_create();
   
   for(var i = ds_map_find_first(Map); !is_undefined(i); i = ds_map_find_next(Map, i))
      ds_list_add(KeyList, i);
      
   return KeyList;

#define DSMAPFIRST
///DSMAPFIRST( map )
   gml_pragma("forceinline");
   return ds_map_find_first(argument[$00]);

#define DSMAPLAST
///DSMAPLAST( map )
   gml_pragma("forceinline");
   return ds_map_find_last(argument[$00]);

#define DSMAPNEXT
///DSMAPNEXT( map, key )
   gml_pragma("forceinline");
   return ds_map_find_next(argument[$00], argument[$01]);

#define DSMAPSIZE
///DSMAPSIZE( map, key )
   gml_pragma("forceinline");
   return ds_map_size(argument[$00]);

#define DSMAPKEY
///DSMAPKEY( map, key )
   gml_pragma("forceinline");
   return ds_map_exists(argument[$00], argument[$01]);

#define DSMAPEXISTS
///DSMAPEXISTS( map )
   gml_pragma("forceinline");
   return ds_exists(argument[$00], ds_type_map);

#define DSMAPCLEAR
///DSMAPCLEAR( map )
   gml_pragma("forceinline");
   ds_map_clear(argument[$00]);

#define DSMAPEMPTY
///DSMAPEMPTY( map )
   gml_pragma("forceinline");
   return ds_map_empty(argument[$00]);

#define DSMAPCOPY
///DSMAPCOPY( map_srce, map_dest )
   gml_pragma("forceinline");
   ds_map_copy(argument[$01], argument[$00]);
   return argument[$01];

#define DSMAPCLONE
///DSMAPCLONE( map )
   var Map = argument[$00],
      Clone = ds_map_create();
   ds_map_copy(Clone, argument[$00]);
   return Clone;

