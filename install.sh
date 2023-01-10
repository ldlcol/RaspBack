# Installing ffmpeg and git
apt update -y && apt full-upgrade -y && apt autoremove -y && apt autoclean -y
apt install -y git ffmpeg

# Cloning repo into /home/pi/RaspBack/
cd /home/pi/ && git clone https://github.com/ldlcol/RaspBack
chmod +x /home/pi/RaspBack/stream.sh

# Making new config file, please edit the config files to match your settings
cp /home/pi/RaspBack/main.conf.example /home/pi/RaspBack/main.conf

# Setting up the script at launch
echo "sh /home/pi/RaspBack/stream.sh" >> /etc/rc.local
