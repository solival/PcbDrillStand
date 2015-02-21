// PCB Drill Press for Hobby Drills
//
// Drill base
//
// Copyright Mark Benson - Sept 2013
// 
// Licensed under:
// Creative Commons Attribution-NonCommercial-ShareAlike 3.0
//

// Call module here to render model for printing
// Comment out when calling from drill_press_assembly or you 
// will end up with two copies of the model.
base();


//Include Joseph Prusas lib for nuts
include <functions.scad>


module base()
{

difference()
{
	hull()
	{
		translate([0,0,0])
		rotate([0,0,0])
		cube([100,100,3], center=true);

		translate([0,0,4])
		rotate([0,0,0])
		cube([95,95,3], center=true);
	}
	//end hull

	translate([0,19,-3])
	rotate([0,0,0])
	cylinder(r=10/2, h=15, $fn=50);

	translate([0,-42,-2])
	nut(13.5,8);
}

translate([0,-42,0])
rotate([0,0,0])
postMount();

module postMount()
{
	difference()
	{
		translate([0,0,-1.5])
		rotate([0,0,0])
		cylinder(r=20/2, h=20, $fn=50);
	
		translate([0,0,-5])
		rotate([0,0,0])
		cylinder(r=8/2, h=40, $fn=50);

		translate([0,0,-2])
		nut(13.5,8);
	}
}

translate([1.5,-33,-10])
rotate([0,0,180])
eqTriangle(20,3);

translate([9,-43.5,-10])
rotate([0,0,90])
eqTriangle(20,3);

translate([-9,-40.5,-10])
rotate([0,0,270])
eqTriangle(20,3);

}//end module base()



//x = 10;
//thickness = 3;

//eqTriangle(x,thickness);

//Warning - rough and ready module to make an equalateral triangle
//from cubes. Will place the tranagle somewhere in space as I haven't
//calculated any offsets yet.
module eqTriangle(baseLength,width)
{
	

	hypot = sqrt((baseLength*baseLength)+(baseLength*baseLength));
	echo("Calculating triangle hypotenuse:", hypot);

	difference()
	{	
		translate([0,0,0])
		rotate([45,0,0])
		cube([width,baseLength,baseLength]);

		translate([-1,hypot/2-2*baseLength,hypot/2-2*baseLength])
		rotate([0,0,0])
		cube([width+2,2*baseLength,2*baseLength]);

		translate([-1,0,0])
		rotate([0,0,0])
		cube([width+2,2*baseLength,2*baseLength]);
	}
}//end module triangle
