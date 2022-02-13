#!/bin/bash

# Load variables and set lights to defaults
source config.sh
source lights.sh

# Starting waiting loop
while true
do
        #LAUNCHING STREAM
        setLightState $GREEN $OFF
        setLightState $RED $ON
        sleep 2
        setLightState $RED $OFF
        setLightState $GREEN $ON
        ffmpeg \
                -re -f v4l2 -thread_queue_size 2048 -s $videosize -input_format $videocardtype -framerate $framerate -i $videocard \
                -f alsa -ac $audiochannels -thread_queue_size 4096 -i $audiocard -c:a $audioencoder -b:a $bitrateaudio -ar $sampling \
                -vf format=$outputformat -c:v $encoder -b:v $bitrate -preset $preset -f flv - | ffmpeg -i - -c copy -f flv -drop_pkts_on_overflow 1 -attempt_recovery 1 -recovery_wait_time 1 $streamkey
done

###############################################################
# -x264opts keyint=$keyframe -g $framerate -pix_fmt yuv420p \
# ffmpeg_command = ffmpeg -nostdin -re -f v4l2 -s "$resolution" -framerate $framerate -i $videocard -f alsa -ac 2 -i "$audiocard" -vcodec libx264 -framerate $framerate -rtbufsize $buffer -s $resolution -preset $preset -pix_fmt yuv420p -crf 17 -force_key_frames ‘expr:gte(t,n_forced*2)’ -minrate $buffer -maxrate $buffer -b:v $buffer -bufsize $buffer -acodec l>
# ffmpeg \
#         -f v4l2 -input_format $videocardtype -framerate $framerate -s $videosize -i $videocard \
#         -f alsa -ac $audiochannels -i $audiocard \
#         -c:v $encoder -b:v $bitrate -preset $preset -vf format=$outputformat \
#         -c:a $audioencoder -b:a $bitrateaudio \
#         -f flv -drop_pkts_on_overflow 1 -attempt_recovery 1 -recovery_wait_time 1 $streamkey
