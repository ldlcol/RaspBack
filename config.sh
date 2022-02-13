# VIDEO INPUT
videocard="/dev/video0"
videocardtype="mjpeg"

# AUDIO INPUT
audiocard="hw:CARD=MS2109,DEV=0"

# VIDEO OUTPUT
videosize="1280x720"
encoder="h264_v4l2m2m"
preset="ultrafast"
framerate="30"
keyframe="60"
bitrate="2000k"
outputformat="yuv420p"

#AUDIO OUTPUT
bitrateaudio="128k"
audioencoder="aac"
audiochannels=2"
sampling="48000"

# RTMP DETAILS
ingesturl="rtmp://mrs02.contribute.live-video.net/app"
ingestkey="live_60231354_NH447CqBW5ZOmAN98Xm1ss"
streamkey="$ingesturl/$ingestkey"
