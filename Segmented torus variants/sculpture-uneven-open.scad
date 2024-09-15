include <polyround.scad>

radial_vect = [45, 60];
slant_vect = rands(-10, 10, 19, 656294587);

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
    extor = 1.8;
    rotor = r*360;
    scale = 1.2;
    twist = (5*sin(r*180))^2 -10;

    rotate([0, rotor, 0])
        translate([25, 0, 0])
            scale(scale)
                linear_extrude(height=extor, center=true)
                    rotate([0, 0, 90]) 
                        shape(r, twist);
}

module shape(r, twist) {
    radiiPoints=[
        [               0,   0,  1],
        [               8,  35,100],
        [  upper_slant(r), 100,  1],
        [upper_slant(r)/3,  90, 50],
        [           twist, 120,  1],
        [lower_slant(r)/3,  90, 50],
        [  lower_slant(r), 100,  1],
        [              -8,  35,100],
    ];
    rotate([0, 0, 180])
        translate([0, 0, 0]) 
            polygon(polyRound(radiiPoints,30));
}

function upper_slant(r) =  30-slant_vect[seg(r)];
function lower_slant(r) = -30-slant_vect[seg(r)];
function seg(r) = floor(r*18);

module cuts() {
    for (i = [0: 1: 17]) {
        rotate([0, 0, i*20]) 
            translate([radial_vect[i%2], 0, 0])
                cut();
    }
}

module cut() {
    rotate([90, 0, 0])
        linear_extrude(5, center=true)
        polygon([
            [ 0, -40],
            [140,-50],
            [140, 50],
            [ 0,  40],
            [ 0,   8],
            [50,   0],
            [ 0,  -8]
        ]);
}

// stationary torus
sculpture();
