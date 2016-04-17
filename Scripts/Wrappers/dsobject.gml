#define DSTYPE
///DSTYPE( ds-object )
   var ds = argument[$00];
   
   if (is_array(ds)) {
      if (ds_exists(ds[@ DS_OBJECT], ds[@ DS_TYPE])) {
         return ds[@ DS_TYPE];
      }
   }
   
   return undefined;

#define DSOBJECT
///DSOBJECT( type, param0, param1, ... )
   var dsobject = $00,
      type = argument[$00];
   
   switch(type) {
      case ds_type_list:
         dsobject[$00] = ds_list_create();
         dsobject[$01] = type;
      break;
      case ds_type_grid:
         dsobject[$00] = DSGRID(argument[$01], argument[$02]);
         dsobject[$01] = type;
      break;
      case ds_type_map:
         dsobject[$00] = ds_map_create();
         dsobject[$01] = type;
      break;
      case ds_type_queue:
         dsobject[$00] = ds_queue_create();
         dsobject[$01] = type;
      break;
      case ds_type_stack:
         dsobject[$00] = ds_stack_create();
         dsobject[$01] = type;
      break;
      case ds_type_priority:
         dsobject[$00] = ds_priority_create();
         dsobject[$01] = type;
      break;
   }
   
   return dsobject;

#define DSISVALID
///DSISVALID( ds-object )
   var ds = argument[$00];
   
   if (is_array(ds)) {
      if (ds_exists(ds[@ DS_OBJECT], ds[@ DS_TYPE])) {
         return TY_TRUE;
      }
   }
   
   return TY_FALSE;

#define DSCLONE
///DSCLONE( ds-object )
   var ds = argument[$00];
   
   if (is_undefined(ds) || !DSISVALID(ds))
      return $00;
      
   var type = ds[@ DS_TYPE],
      clone = IF(type != ds_type_grid, DSOBJECT(type), $00),
      object = ds[@ DS_OBJECT],
      cloneobject = clone[@ DS_OBJECT];
   
   switch(type) {
      case ds_type_list:
         ds_list_copy(cloneobject, object);
      break;
      case ds_type_grid:
         clone = DSOBJECT(type, ds_grid_width(object), ds_grid_height(object));
         ds_grid_copy(cloneobject, object);
      break;
      case ds_type_map:
         ds_map_copy(cloneobject, object);
      break;
      case ds_type_queue:
         ds_queue_copy(cloneobject, object);
      break;
      case ds_type_stack:
         ds_stack_copy(cloneobject, object);
      break;
      case ds_type_priority:
         ds_priority_copy(cloneobject, object);
      break;
   }
   
   return clone;

#define DSCOPY
///DSCLONE( ds-object, ds-object )
   var srce = argument[$00], dest = argument[$01];
   
   if (is_undefined(ds) || !DSISVALID(ds))
      return $00;
   
   switch(srce[@ DS_TYPE]) {
      case ds_type_list:
         ds_list_copy(dest, srce);
      break;
      case ds_type_grid:
         ds_grid_copy(dest, srce);
      break;
      case ds_type_map:
         ds_map_copy(dest, srce);
      break;
      case ds_type_queue:
         ds_queue_copy(dest, srce);
      break;
      case ds_type_stack:
         ds_stack_copy(dest, srce);
      break;
      case ds_type_priority:
         ds_priority_copy(dest, srce);
      break;
   }
   
   return dest;

#define DSFREE
///DSFREE( ds-object )
   var ds = argument[$00];
   
   if (is_undefined(ds) || !DSISVALID(ds))
      return $00;
   
   switch(ds[@ DS_TYPE]) {
      case ds_type_list:
         ds_list_destroy(ds[@ DS_OBJECT]);
      break;
      case ds_type_grid:
         ds_grid_destroy(ds[@ DS_OBJECT]);
      break;
      case ds_type_map:
         ds_map_destroy(ds[@ DS_OBJECT]);
      break;
      case ds_type_queue:
         ds_queue_destroy(ds[@ DS_OBJECT]);
      break;
      case ds_type_stack:
         ds_stack_destroy(ds[@ DS_OBJECT]);
      break;
      case ds_type_priority:
         ds_priority_destroy(ds[@ DS_OBJECT]);
      break;
   }

#define DSGET
///DSGET( ds-object )
   var ds = argument[$00];
   
   if (DSISVALID(ds))
      return ds[@ DS_OBJECT];
   
   return TY_UNDEFINED;

