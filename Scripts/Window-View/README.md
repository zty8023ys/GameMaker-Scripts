###A collection of scripts to work with window and view systems.
The following link redirects to the [Window & View Systems](https://github.com/FatalSleep/GML-Window-System) repository.

These systems were designed to be an overlay of the existing window and view sytsems in GameMaker which are lacking in features and usability.

--
# GML-Window-System
The script `ScrDrawSurfaceExt` was written by [@Braffolk](https://twitter.com/braffolk) on Twitter.

A simple system for handling window and view resizing in GM.

Window / View scaling. The window system allows you to handle scaling for the window and view. The view scaling functions by multiplying the view width/height by a factor of x. While the window scaling doesn't exactly do this... The window scaling doesn't affect the window size, but rather the window draw size, e.g. the size of the application_surface when drawn. So if you have an absolute window and view of size 640x480 and set the window scaling to 0.5, the application surface will be drawn to the window at half size. The view will remain at 640x480, but will be drawn scaled down to half the size--320x240.

Dependency: Global Game Settings -> Graphics -> Scaling -> Full Scale

<b>Window Configurations:</b>
<br>
The window configuratiosn allows you to change the physical window size as well as how the application_surface is drawn, e.g. the virtual window.

<b>Scene Configurations:</b>
<br>
The scene configurations allows you to change how the view--represented by the specified scene--is displayed and functions. Such as for positioning the view using the scene configurations or preparing scene configurations for future view changes, e.g. when changing resolutions.

<b>Trigger Configurations:</b>
<br>
The trigger configurations are essentially scene events. For example when an explosion occurs, you can apply a trigger or multiple triggers and scene together when the scene is applied to the view via SceneRefreshExt(). Update and run the trigger, then apply the trigger to the scene and voila. Triggers don't change the scene configuration, they are applied to the view along with the scene configuration so that the scene and trigger remain consistent and independent.
In essence this is `view_xy = scene_xy + trigger_xy` when the trigger is relative, else the scene is ignored if the trigger is absolute `view_xy = trigger_xy`.

This set of scripts offers a simple solution to managing window and view configurations.
<br>
<br>
<br>
<b>Creating an absolute window / view combination (where the window / view are the same size and scale).</b>
```
//
// Creating an absolute window / view combination (where the window / view are the same size and scale).
// This is useful for creating applications as opposed to games.
//

// Game Start [Event]
/// Create the window and scene configurations.
global.Window = WindowCreate( width, height, scale );
global.Scene = SceneCreate( view-id, x, y, width, height, h-border, v-border, h-spd, v-spd, scale, angle, visible, enabled );

// Update the window to fit the new parameters.
WindowUpdate( global.Window );

// Update the scene to fit the new parameters.
SceneRefresh( global.Scene );

// Don't auto draw the window, we'll do this manually.
// Is the equivalent of application_surface_draw_enable( true/false );
WindowAutoDraw( false );


// Game End [Event]
///Destroy Window / Scene
ParamsDestroy( global.Window );
ParamsDestroy( global.Scene );


// Step Normal [Event]
/// Handle the window when it's not hidden(minimized) AND not updated.
if ( !WindowHidden() && ( !WindowIsUpdated( global.Window ) || !SceneIsUpdated( global.Scene ) ) ) {
    // Update the physical window and scene to the absolute size, no scaling.
    // This updates the window configuration to be the exact size of the physical window.
    // Then updates the view(scene) configuration to be the same as the window configuration.
    WindowSetSize( global.Window, window_get_width(), window_get_height() );
    SceneSetSize( global.Scene, global.Window[# 0, WP_WIDTH ], global.Window[# 0, WP_HEIGHT] );
    
    // Finally update the physical window and view with the window and view configurations.
    SceneRefresh( global.Scene );
    WindowUpdate( global.Window );
}

// Draw GUI End [Evemt]
/// Draw the window view(application surface) using the window configuration.
// Allows us to draw the application surface using the window configuration's scaling and option origin and rotation.
// Can easily be substituted for draw_surface_ext() for speed.
var ScaleX = surface_get_width( application_surface );
var ScaleY = surface_get_height( application_surface );
WindowDraw( global.Window, global.Scene, global.Window[# 0, WP_WIDTH ] / 2, global.Window[# 0, WP_HEIGHT ] / 2, ScaleX / 2, ScaleY / 2, 0, true );
```
<b>Creating a relative window / view combination (where the window / view are different sizes and scaling).</b>
```
//
// This is useful for creating games as opposed to applications.
//
// This uses the same set-up as for an absolute window with the exception of the step and draw GUI end events.
// Simple don't change the window and scene configuration sizes and draw thapplication surface using relative scaling, voila.
// Note the tr/false at the end of WindowDraw(...) in the Draw GUI End events. True is absolute, false is relative.

// Step Normal [Event]
if ( !WindowHidden() && ( !WindowIsUpdated( global.Window ) || !SceneIsUpdated( global.Scene ) ) ) {
    // Finally update the physical window and view with the window and view configurations.
    SceneRefresh( global.Scene);
    WindowUpdate( global.Window );
}


// Draw GUI End [Evemt]
/// Draw the window view(application surface) using the window configuration.
// Allows us to draw the application surface using the window configuration's scaling and option origin and rotation.
// Can easily be substituted for draw_surface_ext() for speed.
var ScaleX = surface_get_width( application_surface );
var ScaleY = surface_get_height( application_surface );
WindowDraw( global.Window, global.Scene, global.Window[# 0, WP_WIDTH ] / 2, global.Window[# 0, WP_HEIGHT ] / 2, ScaleX / 2, ScaleY / 2, 0, false );
```
<b>Creating and using triggers.</b>
```
/// Create [Event]
// This will create a trigger with the given position that is applied until the timer
// runs out after repeating x number of times.
globbal.Trigger = TriggerCreate( trigger-id, active, absolute, x, y, timer, repeats );

// Step End [Event]
// Use step end event so that the view is updated to it's new position AFTER the scene configuration is set in step normal.
// Sample explosition trigger.
global.Trigger[# 0, TP_XPOS ] = irandom_range( -10, 10 );
global.Trigger[# 0, TP_YPOS ] = irandom_range( -10, 10 );

SceneRefreshExt( global.Scene, global.Trigger );
TriggerRun( global.Trigger );

// Collision [Event]
// Set the trigger to run when we collide with something, e.g. a bomb.
// Runs the trigger for half a second.
global.Trigger[# 0, TP_TIMER ] = room_speed * 0.5;
```
