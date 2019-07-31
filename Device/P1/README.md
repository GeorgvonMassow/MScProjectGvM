# The Prototype P1

Device_simple_test.scad includes the design of the device. The design requires the Channel_simple.scad file in order 
to generate the channels in the device. 
The Channel_simple.scad file in turn requires two modules that are saved in the modules folder. The circ2rect.scad is 
a module that transforms a tube shaped channel into a square shaped channel and vice versa.  The rotate_extrude2.scad 
module helps angling a channel if necessary. 

The Device_simple_test_v0-1-1.stl file is the 3D model of the decice.
