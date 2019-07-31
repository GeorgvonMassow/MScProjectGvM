# HOG Script Trained on 12 Images (HOG-S)

This folder includes everything used to create the trained algorithm as well as the trained algorithm itself. The trained algorithm is the beads_detector.svm file. 
The algorithm is accessed through the test.py script. This script requires 3 inputs. "--detector" needs the path to the trained algorithm. "--image" requires the image the script should run on. "--annotate" is what the detected objects should be labeled as. The detector.py file includes the actual detection process and is accessed through the test.py script.

The training data is included in the beads folder. The gather_annotations.py was used to identify the objects in the training images and annotate them. the script needs 3 inputs: "--dataset" requires the path to the training data. "--annotations" requires the a numpy file name to which the annotations are saved to. "--images" requires a numpy file name to which the images post annotation are saved to.
The annotations for the training performed for this project are saved to annots.npy and the images to image.npy.

The training is performed by the train.py script. The annotation and image numpy files are required as well as the file the trained algorithm is saved to.

This folder also includes test images to test the algorithm on
