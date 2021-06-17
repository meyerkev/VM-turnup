#/bin/env $(which sh)

sudo apt install software-properties-common
sudo add-apt-repository -y ppa:ansible/ansible
sudo apt update
sudo apt install -y python-is-python3 python3-distutils vim chromium-browser git 
sudo usermod -a -G sudo ${USER?}
curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
sudo python /tmp/get-pip.py
sudo pip install ansible

git config --global user.email "meyerkev248@gmail.com"
git config --global user.name "Kevin Meyer"

cd /tmp
git checkout https://github.com/meyerkev/turnup.git
cd VM-turnup

ansible-playbook ubuntu_basic_config.yaml
