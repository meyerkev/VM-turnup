#/bin/env $(which sh)

sudo apt update && upgrade -y
sudo apt install -y python-is-python3 python3-distutils vim chromium-browser git 
sudo usermod -a -G sudo ${USER?}

PIP_INSTALL_PATH=/tmp/get-pip.py
curl https://bootstrap.pypa.io/get-pip.py -o ${PIP_INSTALL_PATH?}
sudo python ${PIP_INSTALL_PATH?}
sudo pip install ansible

git config --global user.email "meyerkev248@gmail.com"
git config --global user.name "Kevin Meyer"

cd /tmp
git clone https://github.com/meyerkev/VM-turnup.git
cd VM-turnup

ansible-playbook ubuntu_basic_config.yaml
