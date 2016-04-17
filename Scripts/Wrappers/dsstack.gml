#define DSSTACK
///DSSTACK()
   gml_pragma("forceinline");
   return ds_stack_create();

#define DSSTACKFREE
///DSSTACKFREE( stack )
   gml_pragma("forceinline");
   ds_stack_destroy(argument[$00]);

#define DSSTACKCLEAR
///DSSTACKCLEAR( stack )
   gml_pragma("forceinline");
   ds_stack_clear(argument[$00]);

#define DSSTACKEMPTY
///DSSTACKEMPTY( stack )
   gml_pragma("forceinline");
   return ds_stack_empty(argument[$00]);

#define DSSTACKSIZE
///DSSTACKSIZE( stack )
   gml_pragma("forceinline");
   return ds_stack_size(argument[$00]);

#define DSSTACKCOPY
///DSSTACKCOPY( stack_srce, stack_dest )
   gml_pragma("forceinline");
   ds_stack_copy(argument[$01], argument[$00]);
   return argument[$01];

#define DSSTACKCLONE
///DSSTACKCOPY( stack )
   var Stack = argument[$00],
      Clone = ds_stack_create();
   ds_stack_copy(argument[$01], argument[$00]);
   return Clone;

#define DSSTACKPEEK
///DSSTACKCOPY( stack )
   gml_pragma("forceinline");
   return ds_stack_top(argument[$00]);

#define DSSTACKPOP
///DSSTACKPOP( stack )
   gml_pragma("forceinline");
   return ds_stack_pop(argument[$00]);

#define DSSTACKPUSH
///DSSTACKPOP( stack, value, ... )
   for(var i = $01; i < argument_count; i ++)
      ds_stack_push(argument[$00], argument[i]);
