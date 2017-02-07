/**
 * An L-shaped conductor.
 *
 * This file describes a Conductor, eg. a wire. It can base the shape of the
 * conductor on an electrical `current` that must be passed into the call
 * to the module.
 *
 * A conductor must provide the following interface:
 *   - ConductorProfile(current) [Module] Draws the profile of a single conductor on the XY-space
 *   - conductor_width() [Function] Returns the X-spread of a single conductor
 *   - conductor_height() [Function] Returns the Y-spread of a single conductor
 */

conductor_thickness = .5;

function conductor_width() = 4;
function conductor_height() = 12;

module ConductorProfile(current)
{
	union() {
		square([conductor_width(), conductor_thickness]);
		square([conductor_thickness, conductor_height()]);
	}
}

module Conductor(length)
{
	linear_extrude(length)
	ConductorProfile();
}
