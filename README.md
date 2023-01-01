# RaspBack
A RaspberryPi4 Backpack Project

Run install.sh or execute the commands :
```
apt update -y && apt full-upgrade -y && apt autoremove -y && apt autoclean -y
apt install -y git ffmpeg
cd /home/pi/ && git clone https://github.com/painteau/RaspBack
cp /home/pi/RaspBack/main.conf.example /home/pi/RaspBack/main.conf
chmod +x /home/pi/RaspBack/stream.sh
chmod +x /home/pi/RaspBack/lights.conf
echo "bash /home/pi/RaspBack/stream.sh" >> /etc/rc.local
```