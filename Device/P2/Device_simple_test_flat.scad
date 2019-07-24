use <channel_simple.scad>;

id = 1;
od = 2;
d = 5;
ih = 0.5;
len = 33;
pd = 3;
cw = 1;
fn = 100;
peh = 1;
oph = 2;
iph = 2;
len2 = 5;
hor_in = 1;
hor_out = 1;

slide_h = 1;
slide_w = 25;
slide_l = 75;

// overall block
space = 8;
blockwidth = slide_w + space * 2;
chan_offset = 2;
chan_sp = 4;

h = d;
tl = len;

scr_ext_offset = 6;
scr_int_offset = 2;
scr_depth = d + 2 * peh;
scr_diam = 2.5;

difference() {
    
    // Main block
    
    translate([0,0,0]){
        cube([blockwidth, tl, h]);
    }
    union() {
        
        // Channels
        
        translate([space + chan_offset + chan_sp * 1,0,0]){
            channel_simple(id = id, od = 2.1, d = d, ih = ih, len = len, pd = 4, cw = cw, fn = fn, peh = peh, oph = oph, iph = iph, len2 = len2, hor_in = hor_in, hor_out = hor_out);
        }
        
        translate([space + chan_offset + chan_sp * 2,0,0]){
            channel_simple(id = id, od = 2.1, d = d, ih = ih, len = len, pd = 4, cw = cw, fn = fn, peh = peh, oph = oph, iph = iph, len2 = len2, hor_in = hor_in, hor_out = hor_out);
        }
        
        
        translate([space + chan_offset + chan_sp * 3,0,0]){
            channel_simple(id = id, od = 1.2, d = d, ih = ih, len = len, pd = 6, cw = cw, fn = fn, peh = peh, oph = oph, iph = iph, len2 = len2, hor_in = hor_in, hor_out = hor_out);
        }
        
        translate([space + chan_offset + chan_sp * 4,0,0]){
            channel_simple(id = id, od = 1.2, d = d, ih = ih, len = len, pd = 6, cw = cw, fn = fn, peh = peh, oph = oph, iph = iph, len2 = len2, hor_in = hor_in, hor_out = hor_out);
        }
        
        // Screw holes
        
        translate([space - scr_int_offset, scr_ext_offset, -peh]){
            cylinder(d = scr_diam, h = scr_depth, $fn = fn);
        }
        
        translate([space - scr_int_offset, len - scr_ext_offset, -peh]){
            cylinder(d = scr_diam, h = scr_depth, $fn = fn);
        }
        
        translate([blockwidth - space + scr_int_offset, scr_ext_offset, -peh]){
            cylinder(d = scr_diam, h = scr_depth, $fn = fn);
        }
        
        translate([blockwidth - space + scr_int_offset, len - scr_ext_offset, -peh]){
            cylinder(d = scr_diam, h = scr_depth, $fn = fn);
        }
         
        // Slide
        
        *translate([space,-space,-slide_h]) {
            cube([slide_w,slide_l,slide_h]);
        }
    }
}
