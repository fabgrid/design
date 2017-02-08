/**
 * Functions common to all conductors.
 */

/**
 * The total number of conductors used per strain.
 *
 * @return {number}
 */
function n_conductors() = len(CONDUCTORS_CONFIG);

/**
 * The total width (X) of all conductors.
 *
 * @return {number}
 */
function conductors_width() = n_conductors()*conductor_width() + (n_conductors() - 1)*CONDUCTORS_MARGIN;

/**
 * The total height (Y) of all conductors.
 *
 * @return {number}
 */
function conductors_height() = conductor_height();

module ConductorsProfile()
{
	for (current = CONDUCTORS_CONFIG, index = [0 : n_conductors() - 1]) {
		offset = index*(CONDUCTORS_MARGIN + conductor_width());
		translate([offset, 0, 0])
			ConductorProfile(current);
	}
}

/**
 * Draw a single 3-dimensional conductor.
 *
 * @param {number} length The length of the conductor
 * @param {number} current The electrical current to handle by the conductor
 */
module Conductor(length, current)
{
	linear_extrude(length)
		ConductorProfile(current);
}

/**
 * Draw a set of conductors based on given config.
 *
 * @param {number} length The length of the conductors
 */
module Conductors(length)
{
	linear_extrude(length)
		ConductorsProfile();
}
