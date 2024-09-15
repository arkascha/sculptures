module sculpture() {
    difference() {
        color("snow") body();

        translate([ 150,   0,  -80]) rotate([90, 20, 60]) gap(460);
        translate([-150,   0,  80]) rotate([90, 20, 60]) gap(460);

        translate([ 250, -20,  160]) rotate([90, 20, 60]) gap(260);
        translate([-250,  20, -160]) rotate([90, 20, 60]) gap(260);

        translate([ 420,  0, -0]) gap(200);
        translate([-420,  0, -0]) gap(200);
    }
}

module gap(size) {
    resize([size*1, size*1.1, size*1])
        sphere(1000, $fa=2);
}

module body() {
    resize([1000, 400, 400])
        sphere(1000, $fa=2);
}

// stationary torus
sculpture();
