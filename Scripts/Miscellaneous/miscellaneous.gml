#define ScrAngleClamp
///ScrAngleclamp( angle )
   // DESCRIPTION: Returns the given angle-value clamped to true 0-359 degrees [INLINED].
   if (argument[$00]) {
      return argument[$00] % $0168;
   } else {
      return $0168 + (argument[$00] % -$0168);
   }

#define ScrAngleRotate
///ScrAngleRotate( source, destination, speed )
   // DESCRIPTION: Returns the source angle rotated at the given speed to the destination angle [INLINED].
   gml_pragma("forceinline");
   return median(-argument[$02],  (((argument[$01] - argument[$00]) + $021C) - $B4), argument[$02]);

#define ScrAngleShortest
///ScrAngleShortest( source, destination )
   // DESCRIPTION: Returns the shortest angle path to the destination angle from the source angle [INLINED].
   gml_pragma("forceinline");
   return (((argument[$00] - argument[$01]) + $021C) % $0168) - $B4;

#define ScrAspectRatio
///ScrAspectRatio( width, height )
   // DESCRIPTION: Returns the apect ratio for the given dimensions [INLINED].
   gml_pragma("forceinline");
   return argument[$00] / argument[$01];

#define ScrFontSpriteCreate
///ScrFontSpriteCreate( sprite, map )
   // DESCRIPTION: Returns a new sprite font [INLINED].
   gml_pragma("forceinline");
   return font_add_sprite_ext(argument[$00], argument[$01], $00, $00);

#define ScrScreenShot
///ScrScreenShot()
   // DESCRIPTION: Takes a screenshots of the application surface [INLINED].
   gml_pragma("forceinline");
   return sprite_create_from_surface(application_surface, $00, $00, surface_get_width(application_surface), surface_get_height(application_surface), false, false, $00, $00);

#define ScrTimerCreate
///ScrTimerCreate( length, repeats[infinite] )
   // DESCRIPTION: Creates and returns a new timer configuration.
   var Timer = ds_grid_create($01, $03);
   Timer[# $00, $00] = $00;
   Timer[# $00, $01] = argument0;
   
   switch(argument_count) {
      case $02:
          Timer[# $00, $02] = argument[$01];
      break;
      default:
          Timer[# $00, $02] = undefined;
      break;
   }
   
   return Timer;

#define ScrTimerRun
///ScrTimerRun( array )
   // DESCRIPTION: Executes a timer when called.
   // RETURNS: True if the timer has finished, else false.
   var Timer = argument[$00];
   Timer[# $00, $00] ++;
   
   if (Timer[# $00, $00] < Timer[# $00, $01])
      return false;
      
   if (Timer[# $00, $02] != 0)
      Timer[# $00, $00] = $00;
      
   if (Timer[# $00, $02] > 0)
      Timer[# $00, $02] --;
   
   return false;
