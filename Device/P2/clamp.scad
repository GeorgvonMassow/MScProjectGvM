

module clamp(distance_holes, x_end, y_end, depth, d_screw){
difference (){
cube([distance_holes+x_end*2,y_end*2,depth], center=false);

union (){
    translate ([x_end,y_end,-0.1]) cylinder (d=d_screw, h=depth+0.2);
    translate ([distance_holes+x_end,y_end,-0.1]) cylinder (d=d_screw, h=depth+0.2);
    }
}
}

clamp (distance_holes=29, x_end=4, y_end=4, depth=4, d_screw=3.1);
