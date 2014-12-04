###################################### ###################################### source.list
#RUN echo "deb http://il.archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" > /etc/apt/sources.list && \
#    echo "deb http://il.archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main universe" >> /etc/apt/sources.list


export DEBIAN_FRONTEND=noninteractive
sudo apt-get -y update
sudo apt-get -y upgrade

export list_apt="wget \
  curl \
  gcc \
  libxml2-dev \
  libxslt-dev \
  libcurl4-openssl-dev \
  libreadline6-dev \
  libc6-dev \
  libssl-dev \
  make \
  build-essential \
  zlib1g-dev \
  openssh-server \
  git-core \
  libyaml-dev \
  postfix \
  libicu-dev \
  libfreetype6 \
  libfontconfig1 \
  python-software-properties \
  libfreetype6 \
  sudo \
  tree \
  figlet"
  
#apt-get install -y less net-tools inetutils-ping curl git telnet nmap socat dnsutils netcat tree htop unzip sudo runit
#apt-get install -y build-essential curl zlib1g-dev libreadline-dev libssl-dev libcurl4-openssl-dev git libmysqlclient-dev

#Update your packages and install the ones that are needed to compile Ruby
#apt-get install -y curl libxml2-dev libxslt-dev libcurl4-openssl-dev libreadline6-dev libssl-dev patch build-essential zlib1g-dev openssh-server libyaml-dev libicu-dev
sudo apt-get install -y $list_apt
