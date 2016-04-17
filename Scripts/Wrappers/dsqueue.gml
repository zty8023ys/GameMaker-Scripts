#define DSQUEUE
///DSQUEUE()
   gml_pragma("forceinline");
   return ds_queue_create();

#define DSQUEUEFREE
///DSQUEUEFREE( queue )
   gml_pragma("forceinline");
   ds_queue_destroy(argument[$00]);

#define DSQUEUECLEAR
///DSQUEUECLEAR( queue )
   gml_pragma("forceinline");
   ds_queue_clear(argument[$00]);

#define DSQUEUEEMPTY
///DSQUEUEEMPTY( queue )
   gml_pragma("forceinline");
   ds_queue_empty(argument[$00]);

#define DSQUEUESIZE
///DSQUEUESIZE( queue )
   gml_pragma("forceinline");
   return ds_queue_size(argument[$00]);

#define DSQUEUECOPY
///DSQUEUECOPY( queue_srce, queue_dest )
   gml_pragma("forceinline");
   ds_queue_copy(argument[$01], argument[$00]);
   return argument[$01];

#define DSQUEUECLONE
///DSQUEUECOPY( queue_srce, queue_dest )
   var Queue = argument[$00],
      Clone = ds_queue_create();
   ds_queue_copy(Clone, argument[$00]);
   return Clone;

#define DSQUEUEDEQUEUE
///DSQUEUEDEQUEUE( queue )
   gml_pragma("forceinline");
   ds_queue_dequeue(argument[$00]);

#define DSQUEUEENQUEUE
///DSQUEUEDEQUEUE( queue, value, ... )
   for(var i = $00; i < argument_count; i++)
      ds_queue_enqueue(argument[$00], argument[i]);

#define DSQUEUEFIRST
///DSQUEUEFIRST( queue )
   gml_pragma("forceinline");
   return ds_queue_head(argument[$00]);

#define DSQUEUELAST
///DSQUEUELAST( queue )
   return ds_queue_tail(argument[$00]);
