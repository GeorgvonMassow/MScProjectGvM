# Recording Scripts Used for the RaspberryPi Camera

There are three different Versions, because throughout the creation of a recording script different issues arose. These 
were fixed through different changes.

All verrsions require the same inputs:
- with "-p" or "--picamera" the camera that the script accesses can be changed. the default is the RaspberryPi camera but
can be changed if necessary
- with "-f" or "--fps" the frame rate can be set. The default setting is 10 fps.
- with "-c" or "--codec" the FOURCC/Codec for the recording is selected. The default is set to "XVID" but this can be changed
depending on the preferences.

## The RecordingScript.py Script
This is the so far final version. The frame width is currently set to 720 pixels.

## The RecordingScriptB_W.py Script
This script was created because a colour video couldn't be saved. Therefore, this version transforms the video in to a gray
scaled video. The issue was presumably with the FOURCC/Codec. If the final version doesn't work, this version can be tested.

## The RecordingSquare.py Script
This script was another attempt to fix issues with the FOURCC/Codec. This version records in colour but the image is only
shown in a quarter of the screen. If the other 2 versions don't work this version can be used. 
