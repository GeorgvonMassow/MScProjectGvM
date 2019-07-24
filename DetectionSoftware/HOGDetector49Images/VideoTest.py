from detector import ObjectDetector
import numpy as np
import cv2
import argparse
import imutils

ap = argparse.ArgumentParser()
ap.add_argument("-d", "--detector", required= True,
                help="path to trained detector to load...")
ap.add_argument("-v", "--video", required=True,
                help="path to a video for object detection...")
ap.add_argument("-a","--annotate", default=None, help="text to annotate...")
args = vars(ap.parse_args())

detector = ObjectDetector(loadPath=args["detector"])

vs = cv2.VideoCapture(args["video"])

while(vs.isOpened()):

    ret, imagePath = vs.read()
    imagePath = imutils.resize(imagePath, width=min(400, imagePath.shape[1]))
    image =[]
    image ==imagePath
    if imagePath is None:
        break

    #image = imagePath
    detector.detectV(imagePath, annotate=args["annotate"])

    #cv2.imshow("Bead Detector", image)
    #key = cv2.waitKey(1) & 0xFF
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break


vs.release()
cv2.destroyAllWindows()
