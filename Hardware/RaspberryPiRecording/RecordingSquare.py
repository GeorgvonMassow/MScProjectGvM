from imutils.video import VideoStream
import numpy as np
import argparse
import imutils
import time
import cv2

ap = argparse.ArgumentParser()
ap.add_argument("-p", "--picamera", type=int, default=1,
                help="wether or not the Raspberry Pi camera should be used")
ap.add_argument("-f", "--fps", type = int, default=20,
                help="FPS of output video")
ap.add_argument("-c", "--codec", type=str, default="XVID",
                help="codec of output video")
args = vars(ap.parse_args())

print("[INFO] warming up camera...")
vs = VideoStream(usePiCamera=args["picamera"]>0).start()
time.sleep(2.0)

fourcc = cv2.cv.FOURCC(*args["codec"])
writer = None
(h,w) = (None, None)
zeros = None

while True:
    frame = vs.read()
    frame = imutils.resize(frame, width=500)
    

    if writer is None:
        (h,w) = frame.shape[:2]
        writer=cv2.VideoWriter("test.avi", fourcc, args["fps"],
                               (w*2,h*2), True)
        zeros = np.zeros((h,w), dtype="uint8")

    (B,G,R) = cv2.split(frame)
    R = cv2.merge([zeros, zeros, R])
    G = cv2.merge([zeros, G, zeros])
    B = cv2.merge([B, zeros, zeros])

    output = np.zeros((h*2, w*2, 3), dtype="uint8")
    output[0:h, 0:w] = frame
    output[0:h, w:w*2]=R
    output[h:h*2,w:w*2]=G
    output[h:h*2, 0:w]=B

    writer.write(output)

    #cv2.imshow("Frame", frame)
    cv2.imshow("Output", output)
    key = cv2.waitKey(1)& 0xFF

    if key == ord("q"):
        break
print("[INFO] cleaning up...")
cv2.destroyAllWindows()
writer.release()

    

        
