module circ2rect(r = 1, w = 2, h = 1, l = 10, e = 1, fn = 100, baseslevel = 0, inclevel = 0) {

// produced shape with a circular cross-section at one end and rectangular cross-section at the other.

// r = circle radius
// w & h = width and height of rectangle
// l = length
// e = length of cylinder & cuboid
// baseslevel = 0 for centres of circle and rectangle level, 1 for bases level
// inclevel = increase in level from circle to rectangle

    ct = baseslevel * r;
    rt = baseslevel * h/2 + inclevel;

    hull() {
        // cylinder
        translate([0,0,ct]){
            rotate([-90,0,0]){
                cylinder(r=r, h = e, $fn = fn);
            }
        }
        // rectangle
        translate([0, l - e/2, rt]) {
            cube([w,e,h], center = true);
        }
    }
}

circ2rect();
