#must install package sudo on Dockerfile
#RUN         apt-get install -y -q 
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
build-essential 
cowsay
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
