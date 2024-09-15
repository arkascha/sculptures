module sculpture() {
    intersection() {
        color("snow") body();
//        hull();
    }
}

module body() {
    for (r = [-1:0.03:1]) {
        echo("> ", r);

        translate([0, 0, 1500*r])
            spiral(r);
    }
}

module spiral(r) {
    linear_extrude(100, center=true)
        shape(3, 500*sin(360*r), 10*r);
}
    
module shape(numberOfRidges, translationOfSegments, rotationOfShape) {
    echo(">> ",  translationOfSegments);
    difference() {
        circle(r=1000);
        rotate([0, 0, rotationOfShape])
            segments(360/numberOfRidges, translationOfSegments);
    }
}

module segments(anglePerRidge, translationOfSegments) {
    for (i = [0:anglePerRidge:359]) {
        rotate(a=i, v=[0,0,1])
            segment(translationOfSegments);
    }
}

module segment(translationOfSegments) {
    points=[[0,0],[1,2],[-1,2]];

    translate([0, translationOfSegments, 0])
        scale([1000, 1000, 1000])
            polygon(points);
}

module hull() {
    resize([2000, 2000, 3000])
        sphere(1000, $fa=2);
}

// stationary torus
sculpture();
