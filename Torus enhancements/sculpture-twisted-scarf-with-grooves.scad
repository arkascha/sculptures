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
    g=15*sin(r*180);
    color("snow") difference() {
        scale(1) base();
    }
    color("red")
    translate([ 2.5, 0, 0]) rotate([0, 0, 60]) scale(0.3) groove(g);
}

module base() {
    intersection() {
        translate([ 0, 8, 0]) circle(r=10, $fn=500);
        translate([ 0,-8, 0]) circle(r=10, $fn=500);
    }
}

module groove(g) {
    union() {
        polygon([[ g, 0], [ g+10, 3], [ g+10, -3]]);
        polygon([[-g, 0], [-g-10, 3], [-g-10, -3]]);
    }
}

// stationary torus
sculpture();

// visualization of base shape

//for (r = [0:0.1:1]) {
//    translate([0, -1000, r*500]) rotate([0, 0, 90]) scale(30) shape(r);
//}

//for (g = [-5:1:5]) {
//    translate([0, -1000, g*100]) rotate([0, 0, 90]) scale(30) groove(g);
//}
