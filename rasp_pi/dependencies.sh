#/bin/env $(which sh)

set -e

sudo apt update && sudo apt upgrade -y
sudo apt install -y python-is-python3 python3-distutils vim chromium-browser git wget curl
sudo usermod -a -G sudo ${USER?}

PIP_INSTALL_PATH=/tmp/get-pip.py
# Not the greatest, but some versions of curl don't -o correctly
curl https://bootstrap.pypa.io/get-pip.py > ${PIP_INSTALL_PATH?}
sudo python ${PIP_INSTALL_PATH?}
sudo pip install ansible

git config --global user.email "meyerkev248@gmail.com"
git config --global user.name "Kevin Meyer"

cd /tmp
git clone https://github.com/meyerkev/VM-turnup.git
cd VM-turnup

ansible-playbook ubuntu_basic_config.yaml
