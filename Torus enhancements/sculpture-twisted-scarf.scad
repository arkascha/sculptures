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
    scale = 10+30*sin(r*180-90)^2;
    twist = 180*sin(r*180+90);

    rotate([0, rotor, 0])
        translate([500, 0, 0])
            rotate([0, 0, twist])
                scale(scale)
                    linear_extrude(height=extor, center=true)
                        rotate([0, 0, -45]) 
                            shape(r);
}

module shape(r) {
    s1=0.6*(sin(r*180+90)^2);
    s2=0.6*(sin(r*360)^2);
    s3=0.6*(sin(r*180+90)^2);
    difference() {
        scale(1) base();
//        translate([ 2.5, 0, 0]) rotate([0, 0, 90]) scale([s1, s1, 1.5]) base();
//        translate([ 0.0, 0, 0]) rotate([0, 0, 90]) scale([s2, s2, 1.5]) base();
//        translate([-2.5, 0, 0]) rotate([0, 0, 90]) scale([s3, s3, 1.5]) base();
    }
}

module base() {
    intersection() {
        translate([ 0, 8, 0]) circle(r=10, $fn=500);
        translate([ 0,-8, 0]) circle(r=10, $fn=500);
    }
}

// stationary torus
color("snow") sculpture();

// visualization of base shape

//for (r = [0:0.1:1]) {
//    translate([0, -1000, r*500]) rotate([0, 0, 90]) scale(30) shape(r);
//}
