// PCB Drill Press for Hobby Drills
//
// Sliding wedge with rack to move drill up and down
//
// Copyright Mark Benson - Sept 2013
// 
// Licensed under:
// Creative Commons Attribution-NonCommercial-ShareAlike 3.0
//

// Call module here to render model for printing
// Comment out when calling from drill_press_assembly or you 
// will end up with two copies of the model.
//rotate([90,180,0])
//slidingWedge();

// Include publicDomainGearV1.1.scad to generate rack gear
include <publicDomainGearV1.1.scad>;


module slidingWedge()
{

translate([0,-20,11])
rotate([0,0,0])
difference()
{
translate([-17.5,20,0])
scale([0.98,0.98,0.98])
linear_extrude(height=100, center=true)
polygon( points=[[0,0],[5,10],[30,10],[35,0]] );

//rack gear to remove from sliding wedge
translate([0,23,55]) rotate([0,90,0]) rack(8,20,10,10);


translate([10,20,-6])
rotate([90,0,0])
countersunkScrewHeadM3();

translate([-10,20,-6])
rotate([90,0,0])
countersunkScrewHeadM3();

translate([10,20,-40])
rotate([90,0,0])
countersunkScrewHeadM3();

translate([-10,20,-40])
rotate([90,0,0])
countersunkScrewHeadM3();
}

//screw hole (counter sunk) for securing drill mount to sliding plate
module countersunkScrewHeadM3()
{
	union()
	{
		color("red")
		rotate([0,0,0])
		translate([0,0,0])
		cylinder(r=6/2, h=10, center=true, $fn=50);
	
		color("red")
		rotate([0,0,0])
		translate([0,0,-10])
		cylinder(r=3.5/2, h=20, center=true, $fn=50);
	}
} //end of countersunkScrewHeadM3

}//end of module slidingWedge()