module sculpture() {
        difference() {
            $fn=200;
            sphere(1000);
            translate([ -360,   294,  430]) sphere( 650);
            translate([ -270,   500, -110]) sphere( 960);
            translate([ -600,  -950,    0]) sphere( 700);
            translate([ 1700,  -600, -200]) sphere(2000);
            translate([  480,  -300,  200]) sphere( 960);
            translate([  -80,   100, -540]) sphere( 600);
            translate([ 180, 200, 230]) sphere( 850);
        }
}

// stationary torus
color("snow") sculpture();
