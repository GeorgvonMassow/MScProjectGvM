import argparse
import datetime
import imutils
import cv2
import numpy as np
 
# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required=True,
	help="path to the input image")
ap.add_argument("-w", "--win-stride", type=str, default="(8, 8)",
	help="window stride")
ap.add_argument("-p", "--padding", type=str, default="(16, 16)",
	help="object padding")
ap.add_argument("-s", "--scale", type=float, default=1.05,
	help="image pyramid scale")
ap.add_argument("-m", "--mean-shift", type=int, default=-1,
	help="whether or not mean shift grouping should be used")
args = vars(ap.parse_args())

winStride = eval(args["win_stride"])
padding = eval(args["padding"])
meanShift = True if args["mean_shift"] > 0 else False
 
# initialize the HOG descriptor/person detector
hog = cv2.HOGDescriptor()
hog.setSVMDetector(np.array("beads_detector_lots.svm"))
 
# load the image and resize it
image = cv2.imread(args["image"])
image = imutils.resize(image, width=min(400, image.shape[1]))

(rects, weights) = hog.detectMultiScale(image, winStride=winStride,
	padding=padding, scale=args["scale"], useMeanshiftGrouping=meanShift)

for (x, y, w, h) in rects:
	cv2.rectangle(image, (x, y), (x + w, y + h), (0, 255, 0), 2)
 
# show the output image
cv2.imshow("Detections", image)
cv2.waitKey(0)
