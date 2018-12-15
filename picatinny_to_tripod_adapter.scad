bothParts=true;
part1=true;
part2=!part1;

use <Parametric_NATO_Picatinny_Rail.scad>;

antiRotationPinInsertSide=9.5;
antiRotationPinInsertDepth=3;
antiRotationPinCenterOffset=14;
antiRotationPinDia=4.25;
antiRotationPinLength=5;

railBaseHeight=8;
overlap=0.01;

if (bothParts || part1) {
    difference () {
        nato_rail (11, true, railBaseHeight);
        translate([0,0,-railBaseHeight-overlap])
            cylinder(d=11.3, h=13, $fn=6);
        translate([antiRotationPinCenterOffset,0,-railBaseHeight-overlap+antiRotationPinInsertDepth/2])
            cube([antiRotationPinInsertSide,antiRotationPinInsertSide,antiRotationPinInsertDepth], center=true);
    }
}
if (bothParts || part2) {
    translate([0,20,0])
    union() {
        scale([0.85,0.85,0.9])
            cube([antiRotationPinInsertSide,antiRotationPinInsertSide,antiRotationPinInsertDepth],
                center=true);
        translate([0,0,antiRotationPinInsertDepth/2-overlap])
            cylinder(d=antiRotationPinDia,h=antiRotationPinLength, $fn=50);
    }
}


 