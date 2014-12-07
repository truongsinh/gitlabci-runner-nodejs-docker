
sudo useradd docker
echo "docker:docker" | chpasswd
sudo adduser docker sudo
sudo mkdir -p /home/docker
sudo chown -R docker:docker /home/docker
