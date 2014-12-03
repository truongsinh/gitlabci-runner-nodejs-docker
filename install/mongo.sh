#MongoDB
DEBIAN_FRONTEND=noninteractive

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
    apt-get update
    
sudo apt-get install -y mongodb-org
sudo  mkdir -p /data/db
sudo  chown -R mongodb:mongodb /data
