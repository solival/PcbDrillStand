// PCB Drill Press for Hobby Drills
//
// Gear to drive the rack
//
// Copyright Mark Benson - Sept 2013
// 
// Licensed under:
// Creative Commons Attribution-NonCommercial-ShareAlike 3.0
//

// Call module here to render model for printing
// Comment out when calling from drill_press_assembly or you 
// will end up with two copies of the model.
slideGear();


// Include publicDomainGearV1.1.scad to generate gear
include <publicDomainGearV1.1.scad>;


//Gear
module slideGear()
{
translate([0,0,0])
rotate([0,270,0])
difference()
{
	union()
	{
		color("blue")
		rotate([0,90,0])
		translate([-10,-17,8])
		cylinder(r=20/2, h=10, center=true);
		
		color("yellow")
		rotate([0,90,0])
		translate([-10,-17,0])
		gear(8,15,9,8);
		//gear(pitch-circle,number-of-teeth,gear-thickness,hole-thickness)
	}

	union()
	{	
	//Shaft cutout
	color("blue")
	rotate([0,90,0])
	translate([-10,-17,0])
	cylinder(r=8/2, h=100, center=true);

	//M3 Nut cutout
	color("red")
	translate([16,-10.7,10])
	rotate([0,0,0])
	cube([25,3,6.5], center=true);

	//M3 Screw cutout
	color("red")
	translate([9.5,-10,10])
	rotate([90,0,0])
	cylinder(r=3/2, h=20, $fn=50, center=true);
	}


}

}//end module slideGear()


