// PCB Drill Press for Hobby Drills
//
// Thumbwheel for turning shaft to move drill up and down
//
// Not used in final version - kept incase it is useful
//
// Copyright Mark Benson - Sept 2013
// 
// Licensed under:
// Creative Commons Attribution-NonCommercial-ShareAlike 3.0
//

// Call module here to render model for printing
// Comment out when calling from drill_press_assembly or you 
// will end up with two copies of the model.
//thumbWheel(thumbWheelDiameter, thumbWheelThickness, numberOfGrips, centreBossDiameter, centreBossHeight);

//Default values
thumbWheelDiameter = 55;
thumbWheelThickness = 8;
numberOfGrips = 24;
centreBossDiameter = 15;
centreBossHeight = 8;
shaftDiameter = 8;


module thumbWheel(thumbWheelDiameter, thumbWheelThickness, numberOfGrips, centreBossDiameter, centreBossHeight)
{
	union()
	{
		//Main body of thumbwheel
		difference()
		{
			//Outside of wheel
			translate([0,0,0])
			rotate([0,0,0])
			cylinder(r=thumbWheelDiameter/2, h=thumbWheelThickness, $fn=50);
			
			//Remove inside of wheel
			translate([0,0,2])
			rotate([0,0,0])
			cylinder(r=(thumbWheelDiameter-5)/2, h=thumbWheelThickness, $fn=50);

			//Remove shaft hole
			translate([0,0,-1])
			rotate([0,0,0])
			cylinder(r=shaftDiameter/2, h=centreBossHeight+2, $fn=50);
		}

		//Grips around outside of wheel
		difference()
		{
			//Distribute cylinders around the outside of wheel
			for ( x = [0:numberOfGrips-1])
			{
				rotate((x * 360)/numberOfGrips ,[0,0,1])
				translate([0,thumbWheelDiameter/2-1,0])
				cylinder(r=5/2, h=thumbWheelThickness, $fn=50);
			}
	
			//Remove the inside of the cylinders so it looks neat
			translate([0,0,2])
			rotate([0,0,0])
			cylinder(r=(thumbWheelDiameter-5)/2, h=thumbWheelThickness, $fn=50);
		}
	
		//Create the centre boss to mount the wheel on
		difference()
		{
			translate([0,0,0])
			rotate([0,0,0])
			cylinder(r=centreBossDiameter/2, h=centreBossHeight, $fn=50);

			//Remove shaft hole
			translate([0,0,-1])
			rotate([0,0,0])
			cylinder(r=shaftDiameter/2, h=centreBossHeight+2, $fn=50);
		}
	
	}//end of union
}//end of module

