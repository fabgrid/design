/**
 * A round conductor - just for testing…
 */

DIAMETER = 3.2;

function conductor_width() = DIAMETER;
function conductor_height() = DIAMETER;

/**
 * Draw the cross section of a single conductor.
 *
 * @param {number} current The electrical current (currently ignored ;))
 */
module ConductorProfile(current)
{
	circle(DIAMETER/2, $fn=100);  // $fn shouldn't be hard-coded -> global config
}
