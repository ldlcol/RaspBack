#!/bin/sh

# Load variables and set lights to defaults
source /home/pi/RaspBack/main.conf
# source /home/pi/RaspBack/lights.conf

# Starting waiting loop
while true
do
        #LAUNCHING STREAM
        # setLightState $GREEN $OFF
        # setLightState $RED $ON
        sleep 2
        # pkill -9 -f ffmpeg
        # setLightState $RED $OFF
        # setLightState $GREEN $ON
        ffmpeg \
                -re -f v4l2 -s $videosize -input_format $videocardtype -framerate $framerate -i $videocard -thread_queue_size 384 \
                -f alsa -ac $audiochannels -i $audiocard -c:a $audioencoder -b:a $bitrateaudio -ar $sampling -thread_queue_size 4096 \
                -vf format=$outputformat -c:v $encoder -b:v $bitrate -preset $preset -f flv -drop_pkts_on_overflow 1 -attempt_recovery 1 -recovery_wait_time 1 $streamkey
done
