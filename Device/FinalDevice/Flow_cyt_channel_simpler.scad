$fn=10;
l_chan=40;
l_elb=20;
l_bet=20;
l_end=20;
l_conv=20;
l_out=30;
od=2.1;
module Flow_cyt_channel_simpler(l_chan=30, l_elb=20, l_bet=20, l_end=20, l_conv=20, l_out=20, od=2.1){
difference(){
    union (){
        
        //imaging channel
        
    translate ([0,l_chan/2,0]){ 
        hull(){
        cube([4,l_chan/2,4], center= true);
        translate([0,l_chan/4+l_chan/8,0]){
            cube([3,l_chan/4,3], center=true);
        }
        translate ([0,-l_chan/4-l_chan/8,0]){
            cube([3,l_chan/4,3], center=true);
        }
    }
    }
    
        //flow channels leading to the imaging channel
    
    for(x=[-30,30]){
    rotate ([0,0,x]){
        rotate([90,0,0]){
        hull(){
            translate ([0,0,l_elb/8]){
                cube ([3,3,l_elb/4], center    =true);
            }
            translate ([0,0,l_elb/2]){
                cylinder (d=3, h=l_elb/2+0.4);
            }
        }
        }

    }
    if (x<0){
        translate ([-l_elb/2,-l_elb*sqrt(3)/2+0.4,0]){
            rotate ([90,0,0]){
               cylinder (d=3, h=l_bet);
            }
        }
    }
    else{
         translate ([l_elb/2,-l_elb*sqrt(3)/2+0.4,0]){
            rotate ([90,0,0]){
                cylinder (d=3, h=l_bet);
            }
        }
    }
    translate ([0,-l_elb*sqrt(3)+0.9-l_bet,0]){
        rotate([0,0,x+180]){
            rotate ([90,0,0]){
                cylinder (d=3, h=l_elb);
            }
        }
    }
    }
    translate ([0,-l_elb*sqrt(3)-l_bet+1,0]){
        rotate ([90,0,0]){
            cylinder (d=3, h=l_end/4);
        }
    }
    hull(){
        translate ([0,-l_elb*sqrt(3)-l_bet+1-l_end/4,0]){
            rotate ([90,0,0]){
                cylinder (d=3, h=l_end/4);
            }
        }
        translate ([0,-l_elb*sqrt(3)-l_bet+1-l_end/2,0]){
            rotate ([90,0,0]){
                cylinder (d=od, h=l_end/4);
            }
        }
    }
    translate ([0,-l_elb*sqrt(3)-l_bet+1-l_end/2-l_end/4,0]){
        rotate ([90,0,0]){
            cylinder (d=od, h=l_end/4);
            }
        }
    
    
    
}

        //Inlet for the islets

    rotate ([90,0,0]){
        translate([0,0,5]){
        cylinder (d=1.4,h=15, center=true);
        }
    }
}
rotate ([90,0,0]){
    translate([0,0,5]){
        cylinder (d=1,h=15, center=true);
        }
    }
translate ([0,-10,5]){
        rotate([0,90,180]){
        intersection (){
    translate ([0,0,-1.5]){
        cube(10,10,3);
    }
    rotate_extrude(convexity=10)
    translate([5,0,0]){
        circle (r=1.5);
    }
}
}
}
rotate ([90,0,0]){
    hull(){
        translate([0,0,7.5]){
            cylinder (d=3,h=2.7);
        }
        translate([0,0,5]){
            cylinder (d=1,h=2.5);
        }
    }
        
}
translate ([0,-15,4.8]){
    cylinder (d=3, h=5);
}
    
        //channel leading out of image channel
    
hull(){
    translate([0,l_chan+l_conv/4,0]){
        cube([3,l_conv/2,3], center=true);
    }
    translate ([0,l_chan+l_conv/2,0]){
        rotate([-90,0,0]){
            cylinder(d=3,h=l_conv/2);
        }
    }
}
translate ([0,l_chan+l_conv,0]){
    rotate ([-90,0,0]){
        cylinder(d=3,h=l_out);
    }
}
hull(){
        translate ([0,l_chan+l_conv+l_out,0]){
            rotate ([90,0,0]){
                cylinder (d=3, h=l_end/4);
            }
        }
        translate ([0,l_chan+l_conv+l_out+l_end/4,0]){
            rotate ([90,0,0]){
                cylinder (d=od, h=l_end/4);
            }
        }
    }
    translate ([0,l_chan+l_conv+l_out+l_end/2,0]){
        rotate ([90,0,0]){
            cylinder (d=od, h=l_end/2);
            }
        }
}
Flow_cyt_channel_simpler ();
