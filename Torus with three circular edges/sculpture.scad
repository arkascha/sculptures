include <polyround.scad>

module sculpture() {
    for (r = [0:0.002:1]) {
        echo("> ", r)
        rotate([0,-45,0])
            projection(r);
    }
}

module projection(r) {
    extor = 1.3-sin(r*360);
    rotor = r*360;
    expon = 1.5;
    scale = 8 + 30*sin(r*180)^expon;
    twist = 50+90*sin(r*180)^expon;

    rotate([0, rotor, 0])
        translate([500, 0, 0])
            rotate([0, 0, twist])
                scale(scale)
                    linear_extrude(height=extor, center=true)
                        rotate([0, 0, 90]) 
                            shape(false);
}

module shape(guides=false) {
    radiiPoints=[
        [ 5, 0,0.1],
        [ 3,-3,15],
        [-1,-4,0.1],
        [-4, 0,15],
        [-1, 4,0.1],
        [ 3, 3,15]
    ];

    union() {
        color("DarkCyan") polygon(polyRound(radiiPoints,30));
        if (guides) {
            color("Red") {
                $fn = 100;
                translate([ 5, 0, 0]) circle(0.2);
                translate([-1,-4, 0]) circle(0.2);
                translate([-1, 4, 0]) circle(0.2);
            }
        }
    }
}

// visualization of base shape
//rotate([90, 90, 0]) scale(10) shape(true);

// stationary torus
color("CadetBlue") sculpture();
