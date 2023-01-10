# RaspBack
A RaspberryPi4 Backpack Project

Works on a R4 with 4GB of RAM.

Run install.sh or execute the commands :
```
# Installing ffmpeg and git
apt update -y && apt full-upgrade -y && apt autoremove -y && apt autoclean -y
apt install -y git ffmpeg rpi-update

# Cloning repo into /home/pi/RaspBack/
cd /home/pi/ && git clone https://github.com/ldlcol/RaspBack
chmod +x /home/pi/RaspBack/stream.sh

# Making new config file, please edit the config files to match your settings
cp /home/pi/RaspBack/main.conf.example /home/pi/RaspBack/main.conf

# Setting up the script at launch
echo "sh /home/pi/RaspBack/stream.sh" >> /etc/rc.local
```

For overclocking, change /boot/config.txt
```
over_voltage=6
arm_freq=2147
gpu_freq=750
gpu_mem=256
```
