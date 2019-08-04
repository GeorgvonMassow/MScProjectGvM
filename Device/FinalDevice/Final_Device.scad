
use <Flow_channel_newest_angled.scad>

$fn=50;
l_chan=15;
l_elb=10;
l_bet=10;
l_end=5;
l_conv=10;
l_out=10;
od=2.1;
od_needle=1.2;
diam=2;
d_screw=3.1;
width=30;
l_beginning=l_elb*sqrt(3)+l_bet+l_end-1;
l_after=l_chan+l_conv+l_out;

// Even leveled channel with extra block connecting to glass plate


//Angled sheath fluid; Long inlet into imaging channel

translate([0,0,0.5]){
difference(){
  union(){
    translate ([0,-l_beginning/2,-diam*0.5-1.5]){
        %cube ([width,l_beginning,diam+4],    
        center=true);
    }
    
    translate ([0,l_after/2,-diam*0.5-1.5]){
        %cube ([width,l_after,diam+4],    
        center=true);
    }
    translate ([0,-20,3.5]){
        %cube ([width,10,6], center=true);
    }
    }
    //screw holes
    for(x=[29/2,-29/2]){
        for(y=[width/2-5,-width/2+5]){
            translate([y,l_chan/2+x,-1.1]){
               % cylinder(d=d_screw, h=10, center=true);
            }
        }
    }
    translate([0,0,-0.5]){
    Flow_channel_newest_angled (l_chan=l_chan,l_elb=l_elb, l_bet=l_bet, l_end=l_end, l_conv=l_conv, l_out=l_out, od=od);
    }

}
}

//Channel angled after inlet
