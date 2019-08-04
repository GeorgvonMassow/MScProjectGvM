$fn=50;
l_chan=10;
l_elb=20;
l_bet=20;
l_end=20;
l_conv=20;
l_out=50;
l_hit=30;
od=2.1;
diam = 2;
module Flow_channel_newest_angled(l_chan=15, l_elb=10, l_bet=10, l_end=5, l_conv=10, l_out=5, l_hit=10, od=2.1, diam=2){
difference(){
    union (){
        
        //imaging channel
        
    translate ([0,l_chan/2-0.5,0]){ 
        hull(){
        cube([diam,l_chan/2,diam], center= true);
        translate([0,l_chan/4+l_chan/8,0]){
            cube([diam,l_chan/4+1,diam], center=true);
        }
        translate ([0,-l_chan/4-l_chan/8,0]){
            cube([diam,l_chan/4,diam], center=true);
        }
    }
    }
    
        //flow channels leading to the imaging channel
    
    for(x=[-30,30]){
    rotate ([10,0,x]){
        rotate([90,0,0]){
        hull(){
            translate ([0,0,l_elb/8]){
                cube ([diam,diam,l_elb/4], center    =true);
            }
            translate ([0,0,l_elb/2]){
                cylinder (d=diam, h=l_elb/2+0.4);
            }
        }
        }

    }
    if (x<0){
        translate ([-l_elb/2,-l_elb*sqrt(3)/2+0.4,-1.736]){
            rotate ([90,0,0]){
                cylinder (d=diam, h=l_bet);
            }
        }
    }
    else{
         translate ([l_elb/2,-l_elb*sqrt(3)/2+0.4,-1.736]){
            rotate ([90,0,0]){
                cylinder (d=diam, h=l_bet);
            }
        }
    }
    translate ([0,-l_elb*sqrt(3)+0.9-l_bet,-1.736]){
        rotate([0,0,x+180]){
            rotate ([90,0,0]){
                cylinder (d=diam, h=l_elb);
            }
        }
    }
    }
    translate ([0,-l_elb*sqrt(3)-l_bet+1,-1.736]){
        rotate ([90,0,0]){
            cylinder (d=diam, h=l_end/4);
        }
    }
    hull(){
        translate ([0,-l_elb*sqrt(3)-l_bet+1-l_end/4,-1.736]){
            rotate ([90,0,0]){
                cylinder (d=diam, h=l_end/4);
            }
        }
        translate ([0,-l_elb*sqrt(3)-l_bet+1-l_end/2,-1.736]){
            rotate ([90,0,0]){
                cylinder (d=od, h=l_end/4);
            }
        }
    }
    translate ([0,-l_elb*sqrt(3)-l_bet+1-l_end/2-l_end/4,-1.736]){
        rotate ([90,0,0]){
            cylinder (d=od, h=l_end/4);
            }
        }
    
    
    
}

        //Inlet for the islets

    rotate ([90,0,0]){
        translate([0,0,2]){
        cylinder (d=1.4,h=15, center=true);
        }
    }
}
rotate ([90,0,0]){
    translate([0,0,2]){
        cylinder (d=1,h=15, center=true);
        }
    }
translate ([0,-15,5]){
        rotate([0,90,180]){
        intersection (){
    translate ([0,0,-1.5]){
        cube(10,10,3);
    }
    rotate_extrude(convexity=10)
    translate([5,0,0]){
        circle (r=1);
    }
}
}
}
rotate ([90,0,0]){
    hull(){
        translate([0,0,7.5]){
            cylinder (d=diam,h=7.7);
        }
        translate([0,0,5]){
            cylinder (d=1,h=7.5);
        }
    }
        
}
translate ([0,-20,4.8]){
    cylinder (d=od, h=5);
}
    
        //channel leading out of image channel
    
hull(){
    rotate([-10,0,0]){
        translate([0,l_chan+l_conv/4,1.736*l_chan/10]){
            cube([diam,l_conv/2+1,diam], center=true);
        }
    }
    translate ([0,l_chan+l_conv/2,-0.868]){
        rotate([-100,0,0]){
            cylinder(d=diam,h=l_conv/2+0.5);
        }
    }
}
translate ([0,l_chan+l_conv,-1.736]){
    rotate ([-90,0,0]){
        cylinder(d=od,h=l_out);
    }
}
}
Flow_channel_newest_angled ();