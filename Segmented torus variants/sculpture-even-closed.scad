include <polyround.scad>

radial_vect = [120, 150];

module sculpture() {
    color("snow")
    difference() {
        disk();
        cuts();
    }
}

module disk() {
    union() {
        for (r = [0:0.002:1]) {
            echo("> ", r)
            rotate([90, 0, 0])
                projection(r);
        }
    }
}

module projection(r) {
    extor = 10-sin(r*180);
    rotor = r*360;
    scale = 1.2;
    twist = 2+3*sin(r*180);

    rotate([0, rotor, 0])
        translate([25, 0, 0])
            scale(scale)
                linear_extrude(height=extor, center=true)
                    rotate([0, 0, 90]) 
                        shape(r, twist);
}

module shape(r, twist) {
    radiiPoints=[
        [               0,  -2,  1],
        [  upper_slant(r), 100, 75],
        [           twist, 120,  1],
        [               0, 100, 50],
        [          -twist, 120,  1],
        [  lower_slant(r), 100, 75],
    ];
    rotate([0, 0, 180])
        translate([0, 0, 0]) 
            polygon(polyRound(radiiPoints,30));
}

function upper_slant(r) =  5+50*(1+sin(r*360));
function lower_slant(r) = -5-50*(1-sin(r*360-90));

module cuts() {
    for (i = [0: 1: 17]) {
        rotate([0, 0, i*20]) 
            translate([radial_vect[i%2], 0, 0])
                cut();
    }
}

module cut() {
    cube([150, 5, 200], center=true);
}

// stationary torus
sculpture();
