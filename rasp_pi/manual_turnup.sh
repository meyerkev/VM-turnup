if [ -z $1 ];  then
    echo "Please provide a new hostname"
    exit -1
fi

sudo echo $1 > /etc/hostname
# sudo raspi-config  # Enable ssh
sudo systemctl enable ssh
sudo systemctl start ssh
sudo reboot now
