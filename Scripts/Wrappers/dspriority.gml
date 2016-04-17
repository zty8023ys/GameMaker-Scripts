#define DSPRIORITY
///DSPRIORITY()
   gml_pragma("forceinline");
   return ds_priority_create();

#define DSPRIORITYFREE
///DSPRIORITYFREE( priority )
   gml_pragma("forceinline");
   ds_priority_destroy(argument[$00]);

#define DSPRIORITYCLEAR
///DSPRIORITYCLEAR( priority )
   gml_pragma("forceinline");
   ds_priority_clear(argument[$00]);

#define DSPRIORITYEMPTY
///DSPRIORITYEMPTY( priority )
   gml_pragma("forceinline");
   ds_priority_empty(argument[$00]);

#define DSPRIORITYSIZE
///DSPRIORITYSIZE( priority )
   gml_pragma("forceinline");
   ds_priority_size(argument[$00]);

#define DSPRIORITYCOPY
///DSPRIORITYCOPY( priority_srce, priority_dest )
   gml_pragma("forceinline");
   ds_priority_copy(argument[$01], argument[$00]);
   return argument[$01];

#define DSPRIORITYCLONE
///DSPRIORITYCOPY( priority )
   var Priority = argument[$00],
      Clone = ds_priority_create();
   ds_priority_copy(Clone, argument[$00]);
   return Clone;

#define DSPRIORITYADD
///DSPRIORITYADD( priority, weight, value )
   gml_pragma("forceinline");
   ds_priority_add(argument[$00], argument[$02], argument[$01]);

#define DSPRIORITYCHANGE
///DSPRIORITYADD( priority, weight, value )
   gml_pragma("forceinline");
   ds_priority_change_priority(argument[$00], argument[$02], argument[$01]);

#define DSPRIORITYREMOVEMAX
///DSPRIORITYREMOVEMAX( priority )
   gml_pragma("forceinline");
   ds_priority_delete_max(argument[$00]);

#define DSPRIORITYREMOVEMIN
///DSPRIORITYREMOVEMIN( priority )
   gml_pragma("forceinline");
   ds_priority_delete_min(argument[$00]);

#define DSPRIORITYREMOVEVAL
///DSPRIORITYREMOVEMIN( priority, value )
   gml_pragma("forceinline");
   ds_priority_delete_value(argument[$00], argument[$01]);

#define DSPRIORITYFINDMAX
///DSPRIORITYFINDMAX( priority )
   gml_pragma("forceinline");
   ds_priority_find_max(argument[$00]);

#define DSPRIORITYFINDMIN
///DSPRIORITYFINDMIN( priority )
   gml_pragma("forceinline");
   ds_priority_find_min(argument[$00]);

#define DSPRIORITYFINDWEIGHT
///DSPRIORITYFINDWEIGHT( priority, weight )
   gml_pragma("forceinline");
   ds_priority_find_priority(argument[$00], argument[$01]);
