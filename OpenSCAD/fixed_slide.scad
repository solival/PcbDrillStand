// PCB Drill Press for Hobby Drills
//
// Fixed Slide (main body to hold slide rack, shaft, arm and gear)
//
// Copyright Mark Benson - Sept 2013
// 
// Licensed under:
// Creative Commons Attribution-NonCommercial-ShareAlike 3.0
//

// Call module here to render model for printing
// Comment out when calling from drill_press_assembly or you 
// will end up with two copies of the model.
//fixedSlide();

//Include Josef Prusas hardware functions lib for nut
include <functions.scad>;


module fixedSlide()
{
union()
{
	difference()
	{
		translate([0,0,-15])
		cube([45,15,61], center=true);

		translate([-17.5,0.1,-15])
		linear_extrude(height=75, center=true)
		polygon( points=[[0,0],[5,10],[30,10],[35,0]] );

		//slot for gear
		translate([0,-8,-8.5])
		rotate([0,90,0])
		cylinder(r=45/2, h=10, center=true);

		//slot for gear collar
		translate([9,-8,-8.5])
		rotate([0,90,0])
		cylinder(r=25/2, h=11, center=true);

		//Hole for M3 screw to hold return spring
		translate([-18.5,7,-30])
		rotate([90,0,0])
		cylinder(r=3.2/2, h=11, $fn=50, center=true);

		//Added extra holes to allow tightening spring
		//Hole for M3 screw to hold return spring
		translate([-18.5,7,-15])
		rotate([90,0,0])
		cylinder(r=3.2/2, h=11, $fn=50, center=true);

		//Hole for M3 screw to hold return spring
		translate([-18.5,7,-0])
		rotate([90,0,0])
		cylinder(r=3.2/2, h=11, $fn=50, center=true);

		//Additional Hole for M3 screw to hold return spring
		translate([18.5,7,-0])
		rotate([90,0,0])
		cylinder(r=3.2/2, h=11, $fn=50, center=true);        
	}
	
	translate([22.5,-1.5 ,2.5])
	rotate([180,90,0])
	lug();

	translate([-14.5,-1.5,2.5])
	rotate([180,90,0])
	lug();

	translate([10,-9,-45.5])
	rotate([0,0,180])
	postMount();



}//End union()

module lug()
{
	difference()
	{
		hull()
		{
			translate([10,15,0])
			rotate([0,0,0])
			cylinder(r=20/2, h=8, $fn=50);
	
			translate([0,0,0])
			rotate([0,0,0])
			cube([40,1,8]);
		}

		translate([10,15,-10])
		rotate([0,0,0])
		cylinder(r=8/2, h=28, $fn=50);
	}
}



module postMount()
{
	difference()
	{
		hull()
		{
			translate([10,15,0])
			rotate([0,0,0])
			cylinder(r=20/2, h=10, $fn=50);
	
			translate([0,-5,0])
			rotate([0,0,0])
			cube([20,1,10]);
		}

		//Shaft cutout
		translate([10,15,-5])
		rotate([0,0,0])
		cylinder(r=8.2/2, h=40, $fn=50);

		//Cutout for M8 captive nut
		translate([10,15,5])
		rotate([0,0,0])
		nut(14,6);
	}
}
}//end module fixedSlide()



