module sculpture() {
    for (r = [0:0.001:1]) {
        echo("> ", r)
        rotate([0,-25,0])
            projection(r);
    }
}

module projection(r) {
    extor = 2;
    rotor = r * 360;
    scale = 30 + 50*sin(r*180)^2;
    twist = 40 * sin(r*360) - 20 * cos(r*360);

    rotate([0, rotor, 0])
        translate([2000, 0, 0])
            rotate([0, 0, twist])
                scale(scale)
                    linear_extrude(height=extor, center=true)
                        rotate([0, 0, 90]) 
                            shape(r);
}

module shape(r) {
    scale([5*sin(r*180), 6+5*cos(r*360), 1])
        circle(2, $fn=100);
}

// debug output
//rotate([90, 0, 0]) scale([100, 100, 100]) shape();

// stationary torus
color("#ffcc80") sculpture();
