from imutils.video import VideoStream
import numpy as np
import argparse
import imutils
import time
import datetime
import cv2

ap = argparse.ArgumentParser()
ap.add_argument("-p", "--picamera", type=int, default=1,
                help="wether or not the Raspberry Pi camera should be used")
ap.add_argument("-f", "--fps", type = int, default=10,
                help="FPS of output video")
ap.add_argument("-c", "--codec", type=str, default="XVID",
                help="codec of output video")
ap.add_argument("-a", "--min-area", type=int, default=100,
                help="minimum area size")
ap.add_argument("-b", "--max-area", type=int, default=250,
                help="maximum area size")
args = vars(ap.parse_args())

print("[INFO] warming up camera...")
vs = VideoStream(usePiCamera=args["picamera"]>0).start()
time.sleep(2.0)

fourcc = cv2.cv.FOURCC(*args["codec"])
writer = None
(h,w) = (None, None)
lastUploaded = datetime.datetime.now()
motionCounter = 0

while True:
    frame = vs.read()
    frame = imutils.resize(frame, width=500)
    #frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    frame = cv2.GaussianBlur(frame, (21,21), 0)
    frame = imutils.resize(frame, width=720)

    if writer is None:
        (h,w) = frame.shape[:2]
        writer=cv2.VideoWriter("Video.avi", fourcc, args["fps"],
                               (w,h), False)
       

    

    writer.write(frame)

    cv2.imshow("Frame", frame)
   
    key = cv2.waitKey(1)& 0xFF

    if key == ord("q"):
        break
print("[INFO] cleaning up...")
cv2.destroyAllWindows()
writer.release()

    

        
