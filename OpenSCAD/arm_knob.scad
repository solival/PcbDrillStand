// PCB Drill Press for Hobby Drills
//
// Arm Knob for end of arm
//
// Copyright Mark Benson - Sept 2013
// 
// Licensed under:
// Creative Commons Attribution-NonCommercial-ShareAlike 3.0
//

// Call module here to render model for printing
// Comment out when calling from drill_press_assembly or you 
// will end up with two copies of the model.
//armKnob();

module armKnob()
{
	difference()
	{
		//Body
		sphere(r=25/2, $fn=50);
		
		//Flat on bottom of sphere
		translate([0,0,-12])
		cube([30,30,4], center=true);

		//Hole for M5 threaded rod		
		translate([0,0,-20])
		cylinder(r=5/2, h=30, $fn=50);
	}
}//End of armKnob()