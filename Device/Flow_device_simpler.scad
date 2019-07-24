use <Flow_cyt_channel_simpler.scad>
$fn=100;
l_chan=40;
l_elb=20;
l_bet=20;
l_end=20;
l_conv=20;
l_out=30;
od=2.1;
l_beginning=l_elb*sqrt(3)+l_bet+l_end-1;
l_after=l_chan+l_conv+l_out;

difference(){
    union(){
    translate ([0,-l_beginning/2,-1]){
        cube ([41,l_beginning,6],    
        center=true);
    }
    translate ([0,l_after/2,-1]){
        cube ([41,l_after,6],    
        center=true);
    }
    translate ([0,-15,4]){
        cube ([40,10,4], center=true);
    }
    }
    Flow_cyt_channel_simpler (l_chan=l_chan,l_elb=l_elb, l_bet=l_bet, l_end=l_end, l_conv=l_conv, l_out=l_out, od=od);
    
    for(x=[14.5,-14.5]){
        for (y=[0,40]){
            translate ([x,y,0]){
            cylinder (d=2.7, h=8, center=true);
        }
    }
    }
}

