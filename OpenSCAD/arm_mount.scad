// PCB Drill Press for Hobby Drills
//
// Arm mount
//
// Copyright Mark Benson - Sept 2013
// 
// Licensed under:
// Creative Commons Attribution-NonCommercial-ShareAlike 3.0
//

// Call module here to render model for printing
// Comment out when calling from drill_press_assembly or you 
// will end up with two copies of the model.
//armMount();

//Include Josef Prusas hardware functions lib for nut
include <functions.scad>;



module armMount()
{
	union()
	{
		difference()
		{
			//Arm mount centre
			translate([0,0,0])
			rotate([0,0,0])
			cylinder(r=20/2, h=12, $fn=50);
	
			//Cutout for M8 captive nut
			translate([0,0,-1])
			rotate([0,0,0])
			nut(13.5,6);
			
			//Cutout for M8 gear shaft
			translate([0,0,0])
			rotate([0,0,0])
			cylinder(r=8.2/2, h=30, $fn=50);
		}

		//Arm mount
		translate([0,0,0])
		rotate([0,0,0])
		difference()
		{
			hull()
			{
				//cylinder for m8 arm shaft
				translate([5,0,6])
				rotate([0,90,0])
				cylinder(r=12/2, h=20, $fn=50);
				
				//cube to give one side a flat for printing
				translate([15,0,0.5])
				rotate([0,0,0])
				cube([20,12,1], center=true);
			}

			//Cutout for M8 arm (should be a tight fit, heat shaft to fit or thread, of glue)
			translate([0,0,6])
			rotate([0,90,0])
			cylinder(r=5/2, h=40, $fn=50);

			//Cutout for M8 captive nut
			translate([0,0,-1])
			rotate([0,0,0])
			nut(13.5,6);
		}//End difference for arm mount
	}//End union for whole model
}//End module encapsulation