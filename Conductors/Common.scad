/**
 * Functions common to all conductors.
 */

/**
 * Draw a 3-dimensional single conductor.
 *
 * length: [number] The length of the conductor
 * current: [number] The electrical current to handle by the conductor
 */
module Conductor(length, current)
{
	linear_extrude(length)
	ConductorProfile(current);
}

/**
 * Draw a set of conductors based on given config.
 *
 * length: [number] The length of the conductors
 * config: [vector] A vector of currents, eg. [5, 5, 5] produces three conductors, each taking 5A
 * margin: [number] The distance between two vectors
 */
module Conductors(length, config, margin)
{
	for (current = config, index = [0 : len(config) - 1]) {
		offset = index*(margin + conductor_width());
		translate([offset, 0, 0])
		Conductor(length, current);
	}
}
