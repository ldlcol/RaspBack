echo "alias update='apt update -y && apt full-upgrade -y && apt autoremove -y && apt autoclean -y'" >> /root/.bashrc
echo "alias cls='clear'" >> /root/.bashrc
echo "alias ls='exa'" >> /root/.bashrc
echo "alias stream='bash /home/pi/RaspBack/stream.sh'" >> /root/.bashrc
source ~/.bashrc

update

apt install -y git ffmpeg exa
cd /home/pi/ && git clone https://github.com/painteau/RaspBack


cp /home/pi/RaspBack/config.example /home/pi/RaspBack/config.sh

chmod +x /home/pi/RaspBack/stream.sh
chmod +x /home/pi/RaspBack/lights.sh

echo "bash /home/pi/RaspBack/stream.sh" >> /etc/rc.local
