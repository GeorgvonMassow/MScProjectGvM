$fn=50;
l_chan=5;
l_elb=40;
l_bet=20;
l_end=20;
l_conv=20;
l_out=30;
od=2.1;
od_needle=1.2;
diam=3;
needle_channel=1;
module Flow_channel_test(l_chan=10, l_elb=20, l_bet=10, l_end=15, l_conv=5, l_out=2.5, od=2.1, od_needle=1.2, diam=3, needle_channel=1){
difference(){
    union (){
        
        //imaging channel
        
    translate ([0,l_chan/2,0]){ 
        hull(){
        cube([diam,l_chan/2,diam], center= true);
        translate([0,l_chan/4+l_chan/8,0]){
            cube([diam,l_chan/4,diam], center=true);
        }
        translate ([0,-l_chan/4-l_chan/8,0]){
            cube([diam,l_chan/4,diam], center=true);
        }
    }
    }
    
        //flow channels leading to the imaging channel
    
    for(x=[-30,30]){
    rotate ([0,0,x]){
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
        translate ([-l_elb/2,-l_elb*sqrt(3)/2+0.4,0]){
            rotate ([90,0,0]){
               cylinder (d=diam, h=3);
            }
        }
    }
    else{
         translate ([l_elb/2,-l_elb*sqrt(3)/2+0.4,0]){
            rotate ([90,0,0]){
                cylinder (d=diam, h=3);
            }
        }
    }
    
    hull(){
        translate ([(x/30)*l_elb/2,-l_elb*sqrt(3)/2+0.9-l_bet+l_end/2,0]){
            rotate ([90,0,0]){
                cylinder (d=diam, h=l_end/4);
            }
        }
        translate ([(x/30)*l_elb/2,-l_elb*sqrt(3)/2+0.9-l_bet+l_end/4,0]){
            rotate ([90,0,0]){
                cylinder (d=od, h=l_end/16);
            }
        }
    }
    translate ([(x/30)*l_elb/2,-l_elb*sqrt(3)/2+0.9-l_bet+l_end/4-l_end/16,0]){
            rotate ([90,0,0]){
                cylinder (d=od, h=l_end/4-l_end/16);
            }
        }
    
    }
}

}  
        //channel leading out of image channel
    
hull(){
    translate([0,l_chan+l_conv/4,0]){
        cube([diam,l_conv/2,diam], center=true);
    }
    translate ([0,l_chan+l_conv/2,0]){
        rotate([-90,0,0]){
            cylinder(d=diam,h=l_conv/2);
        }
    }
}
translate ([0,l_chan+l_conv,0]){
    rotate ([-90,0,0]){
        cylinder(d=diam,h=l_out);
    }
}
hull(){
        translate ([0,l_chan+l_conv+l_out,0]){
            rotate ([90,0,0]){
                cylinder (d=diam, h=l_end/4);
            }
        }
        if (diam<=1){
        translate ([0,l_chan+l_conv+l_out+l_end/4,0]){
            rotate ([90,0,0]){
                cylinder (d=diam, h=l_end/4);
            }
        }
    }
    
    else{
        translate ([0,l_chan+l_conv+l_out+l_end/4,0]){
            rotate ([90,0,0]){
                cylinder (d=1, h=l_end/4);
            }
        }
    }
}
    translate ([0,l_chan+l_conv+l_out+l_end/2,0]){
        rotate ([90,0,0]){
            cylinder (d=od, h=l_end/4);
            }
        }
        
        
     //Inlet for needle or tube with Islets
        
    if(needle_channel>0){
        translate ([0,-l_bet/2-l_elb*sqrt(3)/2,0]){
           cube([10,l_bet,10], center=true);
        }
        hull(){
            translate ([0,-10,0]){
                rotate([90,0,0]){
                    cylinder(d=od_needle,h=20);
                }
            }
           translate ([0,-20,0]){
              cube([10,10,10],center=true);
           }
       }
      rotate([90,0,0]){
         cylinder(d=od_needle, h=l_bet);
      }
  }
  else{
      hull(){
          translate([0,-1,0]){
            rotate([90,0,0]){
                cylinder(d=0.6, h=2);
            }
        }
        translate([0,-4,0]){
            rotate([90,0,0]){
                cylinder(d=od_needle,h=2);
            }
        }
    }
    translate([0,-6,0]){          
      rotate([90,0,0]){
         cylinder(d=od_needle,h=10);
      }
  }
  translate([0,-20,0]){
      cube([10,15,10],center=true);
  }
}
}
Flow_channel_test();
