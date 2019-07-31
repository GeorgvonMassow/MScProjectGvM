# The Prototype P2

Device_simple_test_flat.scad includes the design of the device. The design requires the Channel_simple.scad file in order 
to generate the channels in the device. 
The Channel_simple.scad file in turn requires two modules that are saved in the modules folder. The circ2rect.scad is 
a module that transforms a tube shaped channel into a square shaped channel and vice versa.  The rotate_extrude2.scad 
module helps angling a channel if necessary.
the clamp.scad file includes the design of the clamps used to fix the glass plate on to the device. The clamp.stl file 
includes the 3D model of the clamp.

The Device_simple_test_flat.stl file is the 3D model of the decice.
