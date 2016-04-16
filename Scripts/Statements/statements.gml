#define IF
///IF( expression, tresult, fresult )
   gml_pragma(FORCE_INLINE);
   return argument[$01 + (!argument[$00])];

#define FOR
///FOR( start, end, increment, script, params[undefined], dispose[false] )
   var params = IF(argument_count == $05, argument[$04], TY_UNDEFINED),
      dispose = IF(argument_count == $06, argument[$05], TY_FALSE);
   
   for(var xx = argument[$00]; xx < argument[$01]; xx += argument[$02])
      script_execute(argument[$03], xx, params);
   
   if (dispose)
      DSFREE(params);

#define FOREACH
///FOREACH( script, list, dispose[false] )
   var list = argument[$01],
      dispose = IF(argument_count == $03, argument[$02], TY_FALSE);
   
   for(var xx = $00; xx < DSLISTSIZE(list); xx++)
      script_execute(argument[$00], list[| xx], list);
      
   if (dispose)
      DSFREE(params);

#define FOR2D
///FOR2D( x_begin, x_end, x_increment, y_begin, y_end, y_increment, params[undefined] )
   var params = IF(argument_count == $05, argument[ $06 ], TY_UNDEFINED);
   
   for(var yy = argument[$03]; yy < argument[$04]; yy += argument[$05])
      for(var xx = argument[$00]; xx < argument[$01]; xx += argument[$02])
         script_execute(argument[$03], xx, yy, params);
   
   if (params != TY_UNDEFINED)
      DSLISTFREE(params);

#define RANGE
///RANGE( x1, x2, val )
   gml_pragma(FORCE_INLINE);
   return argument[$02] <= argument[$01] && argument[$02] >= argument[$00];

#define INTERSECT
///INTERSECT( x1, x2, y1, y2 )
   gml_pragma(FORCE_INLINE);
   return argument[$00] <= argument[$03] && argument[$02] <= argument[$01];

#define UNDEFINABLE
///UNDEFINABLE( value )
   return is_undefined(argument[$00]);

#define THROW
///THROW( message[Generic Error], abort[false] )
   if (BUILD_MODE == TY_RELEASE)
      return TY_UNDEFINED;
   
   switch(argument_count) {
      case $01:
         show_error("[ERROR]" + argument[$00], TY_FALSE);
      break;
      case $02:
         show_error("[ERROR]" + argument[$00], argument[$01]);
      break;
      default:
         show_error("[ERROR] A generic runtime error has occured.", TY_FALSE);
      break;
   }
