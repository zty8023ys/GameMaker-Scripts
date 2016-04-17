#A collection of miscellaneous scripts.

--
#####ScrAngleClamp( angle )
Takes an angle value and clamps it to true 0-359 or 360 degrees rotation. For example if you have the angle -43984 due to high rotation this script will correct it to the angle 64 which is the `|angle| % 360`. This works by taking the remainder left over from the mod operation to get the actual angle. The easiest way to see this would be in a lower angle for example the angle `362` is `359 + 3` so if we mod that the left over angle is 2.

--
#####ScrAngleRotate( srce, dest, spd )
Given the source angle, rotate the source angle--using the shortest angle path--towards the destination angle at the given speed. This is useful if you need to rotate an object towards a given point giving a realistic "looking" effect; such as a player turning and facing an enemy or object.

--
#####ScrAngleShortest( srce, dest )
Given the source angle find the shortest angle path towards the destination angle. For example given the source angle `45` and the destination angle `295` we have two paths `45 -> 295` and `45 -> 0 -> 359 -> 295` where the difference is `250` for the first path and `109` for the second path. In this case the second path of `109` is returned.

--
#####ScrAspectRatio( length-x1, length-x2 )
Simply returns the `width / height`. The usage for aspect ratio is to return the relative scale of `x` to `y` generally as a percentage. For example taking the screen resolution `1920 x 1080` we want the relative scale of the height to the width which is `1080 / 1920` or `0.5625 or 56.25%`. We then want to scale our screen down from 1080p while keeping the same resolution, we do this by taking the width we want--say 1080 width--and multiplying that by the aspect ratio `1080 * 0.5625 = 607.5`. So now our scaled down screen resolution of the same scale is `1080 x 607.5`; which we can check by getting the aspect ratio again `607.5 / 1080` for `0.5625 or 56.25%`.

--
#####ScrFontSpriteCreate( spr, str-map )
This creates a font from a sprite given the string to map each frame of the sprite to. The string map has to have all of the symbols of the font in the same order as the sprite frames. E.g. if our font is only `0123456789!@#$%^&*()` then our string map must be a string of the same symbols `"0123456789!@#$%^&*()"` and the sprite must contain the same symbols in the same order.

--
#####ScrScreenShot()
Returns a new sprite with an image capture of the `application_surface` with the same dimensions. The application surface is what the game is rendered to in the game window. With the exception of anything drawn the following events: `Post Draw`, `Draw GUI Begin`, `Draw GUI` and `Draw GUI End`. The `application surface` captures the `Draw Begin`, `draw` and `Draw End` events.

--
#####ScrTimerCreate( length, repeats[infinite] )
Creates a timer which is simply a storage--ds grid--container which contains the current iteration and the total number of iterations along with the number of times the timer should repeat. The current iteration is then incremented over each call of script `ScrTimerRun( timer )` until it reaches the total number of iterations.

NOTE: If the repeats argument is not passed to the script, the timer will repeat indefinitely until manually stopped.

--
#####ScrTimerRun( timer )
Executes a timer by incrementing the current iteration until it reaches the total number of iterations. This will repeat until the number of repeats reaches zero unless the number of repeats is infinite.

This script will return `true` until the timer has completed, else `false`.
