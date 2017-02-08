/**
 * A wall mount for conductors designed to be laser-cut from wood.
 */

MATERIAL = 2;  // Thickness of the base material

MARGIN_X = 9;
MARGIN_Y = 4;
DEPTH = 35;
SIDE_FLAT = 15;  // The length over which the top of the sides is flat

/**
 * Place a single wall mount fitted on the `$child` profile.
 *
 * @child A 2D-shape describing the profile of the conductors
 */
module WallMount(conductors_width, conductors_height)
{
	width = conductors_width + 2*MARGIN_X;
	height = conductors_height + 2*MARGIN_Y;

	union() {
		/**
		 * Base
		 */
		cube([width, MATERIAL, DEPTH]);

		/**
		 * Duct
		 */
		translate([0, MATERIAL, (DEPTH - MATERIAL)/2])
			difference() {
				cube([width, height, MATERIAL]);
				translate([MARGIN_X, MARGIN_Y, 0])
					linear_extrude(MATERIAL) child(0);
			}

		/**
		 * Sides
		 */
		translate([-MATERIAL, 0, DEPTH])
		rotate([0, 90, 0])
			LaserWallMountSide(height);
		translate([width, 0, DEPTH])
		rotate([0, 90, 0])
			LaserWallMountSide(height);
	}
}

module LaserWallMountSide(height)
{
	x_center = DEPTH/2;
	flat_half = SIDE_FLAT/2;
	total_height = height+MATERIAL;

	linear_extrude(MATERIAL)
		polygon([
			[0,0], [DEPTH,0],
			[DEPTH,MATERIAL],
			[x_center+flat_half,total_height], [x_center-flat_half,total_height],
			[0,MATERIAL]
		]);
}
