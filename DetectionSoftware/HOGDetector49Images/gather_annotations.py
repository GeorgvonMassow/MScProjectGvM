import numpy as np
import cv2
import argparse
from imutils.paths import list_images
from selectors import BoxSelector

ap = argparse.ArgumentParser()
ap.add_argument("-d","--dataset",required=True,help="path to images dataset...")
ap.add_argument("-a","--annotations",required=True,help="path to save annotations...")
ap.add_argument("-i","--images",required=True,help="path to save images")
args = vars(ap.parse_args())

annotations = []
imPaths = []

for imagePath in list_images(args["dataset"]):
    image = cv2.imread(imagePath)
    bs = BoxSelector(image, "Image")
    cv2.imshow("Image",image)
    cv2.waitKey(0)

    pt1,pt2 = bs.roiPts
    (x,y,xb,yb) = [pt1[0],pt1[1],pt2[0],pt2[1]]
    annotations.append([int(x),int(y),int(xb),int(yb)])
    imPaths.append(imagePath)

annotations = np.array(annotations)
imPaths = np.array(imPaths,dtype="unicode")
np.save(args["annotations"],annotations)
np.save(args["images"],imPaths)

