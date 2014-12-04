export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade
apt-get install -y less net-tools inetutils-ping curl git telnet nmap socat dnsutils netcat tree htop unzip sudo runit
apt-get install -y build-essential curl zlib1g-dev libreadline-dev libssl-dev libcurl4-openssl-dev git libmysqlclient-dev

#Update your packages and install the ones that are needed to compile Ruby
apt-get install -y curl libxml2-dev libxslt-dev libcurl4-openssl-dev libreadline6-dev libssl-dev patch build-essential zlib1g-dev openssh-server libyaml-dev libicu-dev
