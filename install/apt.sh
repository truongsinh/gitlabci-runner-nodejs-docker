#must install package sudo on Dockerfile
#openssh-server sudo curl

ppa1(){
sudo apt-get install -y python-software-properties
sudo 	add-apt-repository -y ppa:git-core/ppa 
sudo  apt-get -y update 
}

apt1(){
while read line;do
commander "sudo apt-get install -y ${line}"
done < <( cat <<START
cowsay
python-software-properties
wget  net-tools pwgen
logrotate supervisor
unzip build-essential zlib1g-dev libyaml-dev libssl-dev libreadline-dev
gcc make 
libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev libpq-dev git-core postfix 
START
)
}


install(){	
ppa1
apt1
}

config(){
which cowsay
whereis cowsay
}

 
test_install(){
  /usr/games/cowsay hi
}
test_config(){
  trace
}
commander $@
