/**
 * In this main file, the entire installation is assembled.
 *
 * Default length unit is millimeters (mm).
 *
 */


/*
|--------------------------------------------------------------------------
| Module Selection
|--------------------------------------------------------------------------
|
| Load the library of components.
|
| Individual components can be swapped out with compatible replacements
| by stating a different file in the following lines.
|
*/
use <Conductors/L-Conductor.scad>;
use <WallMounts/LaserWallMount.scad>;


/*
|--------------------------------------------------------------------------
| Includes
|--------------------------------------------------------------------------
|
| Load some mandatory modules and functions.
|
| These are assumed to be present, so do not change
| anything here, unless you know what you're doing!
|
*/
include <Configuration.scad>;
include <Conductors/Conductor.scad>;
include <WallMounts/WallMount.scad>;


/*
|--------------------------------------------------------------------------
| Assembly
|--------------------------------------------------------------------------
|
| Assemble the final design. This is where the actual model gets its shape.
|
*/
// Conductors(1000);
WallMount(conductors_width(), conductors_height()) {
	ConductorsProfile();
}
