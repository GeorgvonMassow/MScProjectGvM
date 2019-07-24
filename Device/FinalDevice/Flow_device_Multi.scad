use <../channels/Flow_channel_test.scad>
$fn=50;
l_chan=10;
l_elb=20;
l_bet=10;
l_end=15;
l_conv=5;
l_out=2.5;
od=2.1;
width=28;
od_needle=1.2;
l_beginning=l_elb*sqrt(3)/2+l_bet-l_end/4+2.5;
l_after=l_chan+l_conv+l_out+l_end/2-1;



    //entry with needle (size 1.2 mm diameter)
    
translate([1.5*width,0,0]){
difference(){
    union(){
    translate ([0,-l_beginning/2,-1]){
        cube ([width,l_beginning,6],    
        center=true);
    }
    translate ([0,l_after/2,-1]){
        cube ([width,l_after,6],    
        center=true);
    } 
    }
    Flow_channel_test(l_chan=l_chan,l_elb=l_elb, l_bet=l_bet, l_end=l_end, l_conv=l_conv, l_out=l_out, od=od, od_needle=1.2, diam=2, needle_channel=1);


}
}

    //entry with needle (size 1.4 mm diameter)
translate([0.5*width,0,0]){
    difference(){
    union(){
    translate ([0,-l_beginning/2,-1]){
        cube ([width,l_beginning,6],    
        center=true);
    }
    translate ([0,l_after/2,-1]){
        cube ([width,l_after,6],    
        center=true);
    } 
    }
    Flow_channel_test(l_chan=l_chan,l_elb=l_elb, l_bet=l_bet, l_end=l_end, l_conv=l_conv, l_out=l_out, od=od, od_needle=1.4, diam=2, needle_channel=1);
    }

}

    //entry of solution into flow sized at 0.6mm

translate([-0.5*width,0,0]){
    difference(){
    union(){
    translate ([0,-l_beginning/2,-1]){
        cube ([width,l_beginning,6],    
        center=true);
    }
    translate ([0,l_after/2,-1]){
        cube ([width,l_after,6],    
        center=true);
    } 
    }
    Flow_channel_test(l_chan=l_chan,l_elb=l_elb, l_bet=l_bet, l_end=l_end, l_conv=l_conv, l_out=l_out, od=od, od_needle=1.2, diam=1, needle_channel=0);
    }

}

    //channel diameter of 3 mm

translate([-1.5*width,0,0.25]){
    difference(){
    union(){
    translate ([0,-l_beginning/2,-1]){
        cube ([width,l_beginning,6.5],    
        center=true);
    }
    translate ([0,l_after/2,-1]){
        cube ([width,l_after,6.5],    
        center=true);
    } 
    }
    Flow_channel_test(l_chan=l_chan,l_elb=l_elb, l_bet=l_bet, l_end=l_end, l_conv=l_conv, l_out=l_out, od=od, od_needle=1.2, diam=3, needle_channel=1);
    }

}
