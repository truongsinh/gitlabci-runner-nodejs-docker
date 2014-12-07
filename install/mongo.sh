#MongoDB
#https://www.digitalocean.com/community/tutorials/how-to-install-a-mean-js-stack-on-an-ubuntu-14-04-server
install(){
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo  mkdir -p /data/db
sudo  chown -R mongodb:mongodb /data
}

config(){
    sudo mongod &>/dev/null &
}

test1(){
  set +e
  while :;do
     commander  sleep 1
     ( sudo netstat -ntlp | grep mongo ) && break 
  done
  return 0
}

commander $@
