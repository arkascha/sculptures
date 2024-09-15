include <polyround.scad>

module sculpture() {
    for (r = [0:0.002:1]) {
        echo("> ", r)
        rotate([0,-25,0])
            projection(r);
    }
}

module projection(r) {
    extor = 1.3-sin(r*180);
    rotor = r*360;
    scale = 20 + 50*sin(r*180)^2;
    twist = 70*sin(r*360);

    rotate([0, rotor, 0])
        translate([500, 0, 0])
            rotate([0, 0, twist])
                scale(scale)
                    linear_extrude(height=extor, center=true)
                        rotate([0, 0, 90]) 
                            shape();
}

module shape(hull=false) {
    radiiPoints=[[0,1,0.1],[5,-2,15],[0,-4,0.1],[-5,-2,15]];

    union() {
        polygon(polyRound(radiiPoints,30));
        if (hull) %translate([0,0,0.1]) polygon(getpoints(radiiPoints));
    }
}

// visualization of base shape
//rotate([90, 90, 0]) scale(10) shape(true);

// stationary torus
color("#ffcc80") sculpture();
