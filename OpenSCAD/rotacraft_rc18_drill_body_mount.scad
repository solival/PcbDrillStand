// PCB Drill Press for Hobby Drills
//
// RotaCraft RC18 body mount
//
// Copyright Mark Benson - Sept 2013
// 
// Licensed under:
// Creative Commons Attribution-NonCommercial-ShareAlike 3.0
//

// Call module here to render model for printing
// Comment out when calling from drill_press_assembly or you 
// will end up with two copies of the model.
//bodyMount();


module bodyMount()
{
union()
{
//drill collar size
difference()
{
	//color("green")
	rotate([0,0,0])
	translate([0,0,0])
	cylinder(r=36/2, h=8, center=true, $fn=50);

	//color("green")
	rotate([0,0,0])
	translate([0,0,0])
	cylinder(r=30/2, h=10, center=true, $fn=50);

	//color("green")
	rotate([0,0,0])
	translate([12,-1.50,-5])	
	cube([10,3,10]);
}

difference()
{
	//mounting plate neck
	hull()
	{
		//color("green")
		rotate([0,0,0])
		translate([0,0,0])
		cylinder(r=5/2, h=8, center=true, $fn=50);
	
		//color("orange")
		rotate([0,0,0])
		translate([-5,25,-4])	
		cube([10,2,8]);
	}

	//color("green")
	rotate([0,0,0])
	translate([0,0,0])
	cylinder(r=35/2, h=10, center=true, $fn=50);
}

difference()
{
	union()
	{
		//color("orange")
		rotate([0,0,0])
		translate([16,-3.5,-4])	
		cube([8,2,8]);
	
		//color("orange")
		rotate([0,0,0])
		translate([16,1.5,-4])	
		cube([8,2,8]);
	}

	translate([21,0,1.5])
	rotate([0,90,90])
	tearDropHole(3.5,15);	
}

//Mount plate
difference()
{
	//color("orange")
	translate([-15,25,-4])	
	rotate([0,0,0])
	cube([30,2,8]);

	translate([10,20,1.5])
	rotate([0,90,90])
	tearDropHole(3.5,15);	

	translate([-10,20,1.5])
	rotate([0,90,90])
	tearDropHole(3.5,15);	
}

}//union collar parts
}//end bodyMount()



//translate([0,0,0])
//rotate([90,0,0])
//tearDropHole(18,10);

//tear drop hole (for better printing of holes in the 'side' of an object)
module tearDropHole(holeSizeDia, holeDepth)
{
	hull()
	{
		color("blue")
		rotate([0,0,0])
		translate([0,0,0])
		cylinder(r=1/2, h=holeDepth, center=true, $fn=50);

		color("blue")
		rotate([0,0,0])
		translate([holeSizeDia/1.7,0,0])
		cylinder(r=holeSizeDia/2, h=holeDepth, center=true, $fn=50);
	}

}//End of tearDropHole