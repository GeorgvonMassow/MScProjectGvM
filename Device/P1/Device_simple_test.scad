use <channel/channel_simple.scad>;

id = 1;
od = 2;
d = 4;
ih = 0.5;
len = 33;
pd = 3;
cw = 1;
fn = 100;
peh = 1;
oph = 1;
iph = 1;
len2 = 3;
hor_in = 1;
hor_out = 1;

slide_h = 1;
slide_w = 25.1;
slide_l = 75;

// overall block
blockwidth = 24;
space = 4;

h = d + slide_h;
tl = len;

echo(tl);
echo(h);

difference() {
    translate([0,0,0]){
        cube([blockwidth, tl, h]);
    }
    union() {
        translate([4,0,1]){
            channel_simple(id = id, od = 2.1, d = d, ih = ih, len = len, pd = 3, cw = cw, fn = fn, peh = peh, oph = oph, iph = iph, len2 = len2, hor_in = hor_in, hor_out = hor_out);
        }
        
        translate([8,0,1]){
            channel_simple(id = id, od = 2.1, d = d, ih = ih, len = len, pd = 4, cw = cw, fn = fn, peh = peh, oph = oph, iph = iph, len2 = len2, hor_in = hor_in, hor_out = hor_out);
        }
        
        translate([12,0,1]){
            channel_simple(id = id, od = 1.1, d = d, ih = ih, len = len, pd = 6, cw = cw, fn = fn, peh = peh, oph = oph, iph = iph, len2 = len2, hor_in = hor_in, hor_out = hor_out);
        }
        
        translate([16,0,1]){
            channel_simple(id = id, od = 1.2, d = d, ih = ih, len = len, pd = 6, cw = cw, fn = fn, peh = peh, oph = oph, iph = iph, len2 = len2, hor_in = hor_in, hor_out = hor_out);
        }
        
        translate([20,0,1]){
            channel_simple(id = id, od = 1.3, d = d, ih = ih, len = len, pd = 6, cw = cw, fn = fn, peh = peh, oph = oph, iph = iph, len2 = len2, hor_in = hor_in, hor_out = hor_out);
        }
        
        translate([-10,space,0]) {
            cube([75,25,slide_h]);
        }
    }
}
