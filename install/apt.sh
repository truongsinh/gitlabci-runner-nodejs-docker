#must install package sudo on Dockerfile
#RUN         apt-get install -y -q 
#openssh-server sudo curl
search1(){
 apt-cache search fortune
}
update1(){
 sudo  apt-get -y update 
}
add_apt_repository1(){
 sudo apt-get install -y python-software-properties
}

sources1(){
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
}

ppa1(){
sudo 	add-apt-repository -y ppa:git-core/ppa 
}

apt1(){
while read line;do
commander "sudo apt-get install -y -q ${line}"
done <<START
cowsay
pv
toilet
build-essential 
gcc 
git 
git-core 
libcurl4-openssl-dev 
libicu-dev
libpq-dev
libreadline-dev
libreadline-gplv2-dev 
libssl-dev 
libxml2 
libxml2-dev
libxslt1-dev
libxslt-dev 
libyaml-dev
logrotate
lsb-release
make 
net-tools
postfix 
pwgen
python-software-properties
software-properties-common
sudo 
supervisor
tklib
unzip
wget
zlib1g-dev
START
}


install(){	
add_apt_repository1
sources1
ppa1
update1
search1
apt1
}

config(){
which cowsay
whereis cowsay
}

 
test_install(){
  /usr/games/cowsay hi
echo 'great!' | /usr/games/cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1)
}
test_config(){
  trace
}
commander $@
