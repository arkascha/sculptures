include <polyround.scad>

module sculpture() {
    for (r = [0:0.002:1]) {
        echo("> ", r)
        rotate([0,-25,0])
            projection(r);
    }
}

module projection(r) {
    extor = 1.3-sin(r*360);
    rotor = r*360;
    scale = 10+20*sin(r*180)^2;
    twist = 90*sin(r*180);

    rotate([0, rotor, 0])
        translate([500, 0, 0])
            rotate([0, 0, twist])
                scale(scale)
                    linear_extrude(height=extor, center=true)
                        rotate([0, 0, 45]) 
                            shape();
}

module shape() {
    radiiPoints=[
        [ -80,  80, 100],
        [ -70,   0, 300],
        [ -80, -80, 100],
        [  10, -20, 300],
        [  70,   0, 100],
        [  10,  20, 300],
    ];
    rotate([0, 0, 180])
        translate([0, 0, 0]) 
            scale(0.1)
                polygon(polyRound(radiiPoints, 30));
}

// stationary torus
color("snow") sculpture();

// visualize base shape
translate([-1000, 0, 0]) scale(10) shape();
