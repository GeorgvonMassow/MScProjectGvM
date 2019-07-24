use <../../../modules/rotate_extrude2.scad>;
use <../../../modules/circ2rect.scad>;

module channel_simple(id = 1, od = 1.58, d = 4, ih = 0.5, len = 20, pd = 2, cw = 1.5, fn = 100, peh = 1, iph = 1, oph = 1, hor_in = 1, hor_out = 1, len2 = 4){

    // Calculated variables
    pbh = d - pd;
    er = d - pd - ih;
    pcl = pd + peh;
    ich = ih / 2;
    opr = oph - id/2;
    ipr = iph - id/2;
    y_off = hor_in * (pd - er) + er;
    y_add = -(hor_out * (pd - er) + er);

    // islet in port
    if (hor_in == 0) {
        translate([0, 0, pbh]) {
            cylinder(h = pcl, d = od, $fn = fn);
        }
    }
    else
    {
        translate([0, -peh, iph]){
            rotate([-90,0,0]){
                cylinder(d = od, h = pcl, $fn = fn);
            }
        }
    }
        
    // islet in elbow
    if (hor_in == 0) {
        translate([0, er, er + id/2]){
            rotate([0,90,180]){
                rotate_extrude2(angle = 90, convexity = 10, size = 1000) {
                   translate([er, 0]) { circle(d = id, $fn = fn, center = true);
                   }
                }
            }
        }
    }

    // islet in round to square
    translate([0, y_off, ipr * hor_in]){
            circ2rect(r = id/2, w = cw, h = ih, l = len2, e = 0.5, fn = fn,  baseslevel = 1, inclevel = -ipr * hor_in);
        }

    // islet channel
    translate([-cw/2, y_off + len2, 0]) {
        cube([cw, len - y_off - 2 * len2 + y_add, ih]);
    }

    // islet out square to round
    translate([0, len + y_add, opr * hor_out]){
        rotate([0,0,180]){
            circ2rect(r = id/2, w = cw, h = ih, l = len2, e = 0.5, baseslevel = 1, inclevel = -opr * hor_out);
        }
    }
    
    // islet out elbow
    if (hor_out == 0) {
        translate([0, len - er, er + id/2]){
            rotate([0,90,0]){
                rotate_extrude2(angle = 90, convexity = 10, size = 1000) {
                   translate([er, 0]) { circle(d = id, $fn = fn, center = true);
                   }
                }
            }
        }
    }

    // out port
    if (hor_out == 0) {
        translate([0, len, pbh]) {
            cylinder(h = pcl, d = od, $fn = fn);
        }
    }
    else
    {
        translate([0, len - pd, oph]){
            rotate([-90,0,0]){
                cylinder(d = od, h = pcl, $fn = fn);
            }
        }
    }
}

channel_simple(id = 1, od = 1.58, d = 4, ih = 0.5, len = 20, pd = 4, ops = 4, cw = 0.5, fn = 100, peh = 1, oph = 2, iph = 2, len2 = 4, hor_in = 1, hor_out = 1);
