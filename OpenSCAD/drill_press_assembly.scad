// PCB Drill Press for Hobby Drills
//
// Mounts for RotaCraft RC18 included
//
// Copyright Mark Benson - Sept 2013
// 
// Licensed under:
// Creative Commons Attribution-NonCommercial-ShareAlike 3.0
//


// Include the various model files here and then call
// their respective functions/modules below to create
// assembled drill press. Nuts and bolts not rendered.
include <drill_base.scad>
include <fixed_slide.scad>
include <sliding_wedge_rack.scad>
include <rotacraft_rc18_drill_collar_mount.scad>
include <rotacraft_rc18_drill_body_mount.scad>
include <rack_gear.scad>
include <arm_mount.scad>
include <arm_knob.scad>

// Thumbwheel not used in final version but is included
// as an alternative if someone wants to use it.
include <thumb_wheel.scad>

//Drill base
base();

//Shaft for mounting fixed slide to base
//8mm threaded rod
color("lightblue")
translate([0,-42,0])
rotate([0,0,0])
cylinder(r=8/2, h=100, $fn=50);

//Fixed slide
translate([0,-18,130])
rotate([0,0,0])
fixedSlide();

//Sliding wedge
translate([0,-18,100])
rotate([0,0,0])
slidingWedge();

//Tool Collar mount
translate([0,19,102-30])
rotate([0,0,180])
collarMount();

//Tool Body mount
translate([0,19,136-30])
rotate([0,0,180])
bodyMount();

//Shaft for aligning tool to hole in base
/*
color("red")
translate([0,19,0])
rotate([0,0,0])
cylinder(r=5/2, h=190, $fn=50);
*/

//Slide gear
translate([0,-25,139])
rotate([90,0,90])
slideGear();

//Gear Shaft
//8mm threaded rod
color("lightblue")
translate([-40,-35,122])
rotate([0,90,0])
cylinder(r=8/2, h=70, $fn=50);

//Arm mount
translate([-27,-35,122])
rotate([0,90,180])
rotate([1,0,0],a=225)
armMount();

//Arm Shaft
//5mm threaded rod
color("lightblue")
translate([-33,-30,127])
rotate([360-45,0,0])
cylinder(r=5/2, h=80, $fn=50);

//Arm Knob
translate([-33,33,190])
rotate(a=360-45, v=[1,0,0])
armKnob();

//Thumb wheel
//Variables populated within thumb_wheel.scad
/*translate([-39,-35,122])
rotate([90,0,90])
thumbWheel(thumbWheelDiameter, thumbWheelThickness, numberOfGrips, centreBossDiameter, centreBossHeight);*/
