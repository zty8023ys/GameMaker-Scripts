#define DSTYPE
///DSTYPE( ds-object )
   var ds = argument[$00];
   
   if (is_array(ds)) {
      if (ds_exists(ds[@ DS_OBJECT], ds[@ DS_TYPE])) {
         return ds[@ DS_TYPE];
      }
   }
   
   return TY_UNDEFINED;

#define DSOBJECT
///DSOBJECT( type, width[undefined], height[undefined] )
   var dsobject = $00,
      type = argument[$00];
   
   switch(type) {
      case ds_type_list:
         dsobject[@ DS_OBJECT] = DSLIST();
      break;
      case ds_type_grid:
         dsobject[@ DS_OBJECT] = DSGRID(argument[$01], argument[$02]);
      break;
      case ds_type_map:
         dsobject[@ DS_OBJECT] = DSMAP();
      break;
      case ds_type_queue:
         dsobject[@ DS_OBJECT] = DSQUEUE();
      break;
      case ds_type_stack:
         dsobject[@ DS_OBJECT] = DSSTACK();
      break;
      case ds_type_priority:
         dsobject[@ DS_OBJECT] = DSPRIORITY();
      break;
   }
   
   dsobject[@ DS_TYPE] = type;
   return dsobject;

#define DSISVALID
///DSISVALID( ds-object )
   var ds = argument[$00];
   return is_array(ds) && (ds_exists(ds[@ DS_OBJECT], ds[@ DS_TYPE]));

#define DSCLONE
///DSCLONE( ds-object )
   var ds = argument[$00];
   
   if (is_undefined(ds) || !DSISVALID(ds))
      return $00;
   
   var type = ds[@ DS_TYPE],
      clone = IF(type != ds_type_grid, DSOBJECT(type), $00),
      object = ds[@ DS_OBJECT],
      cloneobject = clone[@ DS_OBJECT];
   
   return DSCOPY(object, cloneobject);

#define DSCOPY
///DSCOPY( ds-obj-srce, ds-obj-dest )
   var srce = argument[$00], dest = argument[$01];
   
   if (is_undefined(ds) || !DSISVALID(ds) || srce[@ DS_TYPE] != dest[@ DS_TYPE])
      return $00;
   
   switch(srce[@ DS_TYPE]) {
      case ds_type_list:
         DSLISTCOPY(srce, dest);
      break;
      case ds_type_grid:
         DSGRIDCOPY(srce, dest);
      break;
      case ds_type_map:
         DSMAPCOPY(srce, dest);
      break;
      case ds_type_queue:
         DSQUEUECOPY(srce, dest);
      break;
      case ds_type_stack:
         DSSTACKCOPY(srce, dest);
      break;
      case ds_type_priority:
         DSPRIORITYCOPY(srce, dest);
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
         DSLISTFREE(ds[@ DS_OBJECT]);
      break;
      case ds_type_grid:
         DSGRIDFREE(ds[@ DS_OBJECT]);
      break;
      case ds_type_map:
         DSMAPFREE(ds[@ DS_OBJECT]);
      break;
      case ds_type_queue:
         DSQUEUEFREE(ds[@ DS_OBJECT]);
      break;
      case ds_type_stack:
         DSSTACKFREE(ds[@ DS_OBJECT]);
      break;
      case ds_type_priority:
         DSPRIORITYFREE(ds[@ DS_OBJECT]);
      break;
   }

#define DSGET
///DSGET( ds-object )
   var ds = argument[$00];
   
   if (DSISVALID(ds))
      return ds[@ DS_OBJECT];
   
   return undefined;
