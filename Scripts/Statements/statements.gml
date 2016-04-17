#define IF
///IF( expression, tresult, fresult )
   gml_pragma("forceinline");
   return argument[$01 + (!argument[$00])];

#define FOR
///FOR( start, end, increment, script, params[undefined], dispose[false] )
   var params = undefined, dispose = false;
   
   if (argument_count >= $05)
      params = argument[$04];
   if (argument_count >= $06)
      dispose = argument[$05];
   
   for(var xx = argument[$00]; xx < argument[$01]; xx += argument[$02])
      script_execute(argument[$03], xx, params);
   
   if (dispose && ds_exists(params, ds_type_list))
      ds_list_destroy(params);

#define FOREACH
///FOREACH( script, list, dispose[false] )
   var list = argument[$01],
      dispose = false;
      
   if (argument_count == $03)
      dispose = argument[$02];
   
   for(var xx = $00; xx < ds_list_size(list); xx++)
      script_execute(argument[$00], list[| xx], list);
      
   if (dispose && ds_exists(params, ds_type_list))
      ds_list_destroy(params);

#define FOR2D
///FOR2D( x-begin, x-end, x-increment, y-begin, y-end, y-increment, script, params[undefined], dispose[false] )
   var params = undefined, dispose = false;
   
   if (argument_count >= $08)
      params = argument[$07];
   if (argument_count >= $09)
      dispose = argument[$08];
   
   for(var yy = argument[$03]; yy < argument[$04]; yy += argument[$05])
      for(var xx = argument[$00]; xx < argument[$01]; xx += argument[$02])
         script_execute(argument[$06], xx, yy, params);
   
   if (dispose && !is_undefined(params))
      ds_list_destroy(params);

#define RANGE
///RANGE( x1, x2, val )
   gml_pragma("forceinline");
   return argument[$02] <= argument[$01] && argument[$02] >= argument[$00];

#define INTERSECT
///INTERSECT( x1, y1, x2, y2 )
   gml_pragma("forceinline");
   return argument[$00] <= argument[$03] && argument[$02] <= argument[$01];

#define UNDEFINABLE
///UNDEFINABLE( value )
   gml_pragma("forceinline");
   return is_undefined(argument[$00]);

#define THROW
///THROW( message[Generic Error], abort[false] )
   switch(argument_count) {
      case $01:
         show_error("[ERROR]" + argument[$00], false);
      break;
      case $02:
         show_error("[ERROR]" + argument[$00], argument[$01]);
      break;
      default:
         show_error("[ERROR] A generic runtime error has occured.", false);
      break;
   }
