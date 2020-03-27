
### ***** DOCKER *******************************
### https://docs.docker.com/install/linux/docker-ce/debian/
###
 curl -fsSL https://get.docker.com -o get-docker.sh
 sudo sh get-docker.sh

sudo usermod -aG docker pi
newgrp docker

### Optionally, store containers in an external USB drive. Change the following line (adjust accordingly)
### ExecStart=/usr/bin/dockerd -g /mnt/hdd/docker -H fd://


### ***** DOCKER-COMPOSE *************************
### source: https://dev.to/rohansawant/installing-docker-and-docker-compose-on-the-raspberry-pi-in-5-simple-steps-3mgl

### IMPORTANT! Install proper dependencies
sudo apt-get install -y libffi-dev libssl-dev

sudo apt-get install -y python3 python3-pip

sudo apt-get remove python-configparser

sudo pip3 install docker-compose