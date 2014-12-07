travis_only(){
#or if machine is 12.04
sudo apt-get update

sudo apt-get install ruby1.9.1 ruby1.9.1-dev \
rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 \
build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev

sudo update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.1 400 \
  --slave   /usr/share/man/man1/ruby.1.gz ruby.1.gz \
/usr/share/man/man1/ruby1.9.1.1.gz \
  --slave   /usr/bin/ri ri /usr/bin/ri1.9.1 \
  --slave   /usr/bin/irb irb /usr/bin/irb1.9.1 \
  --slave   /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.1

# choose your interpreter
# changes symlinks for /usr/bin/ruby , /usr/bin/gem
# /usr/bin/irb, /usr/bin/ri and man (1) ruby
sudo update-alternatives --config ruby
sudo update-alternatives --config gem

# now try
ruby --version
}

ruby19(){
sudo  apt-get update -y
sudo  apt-get install -y wget curl gcc libxml2-dev libxslt-dev libcurl4-openssl-dev libreadline6-dev libc6-dev libssl-dev make build-essential zlib1g-dev openssh-server git-core libyaml-dev postfix libpq-dev libicu-dev

mkdir /tmp/ruby 
cd /tmp/ruby 
curl --progress http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.gz | tar xz
cd /tmp/ruby/ruby-1.9.3-p392 
./configure --disable-install-rdoc 
make 
sudo make install
}

install_ruby_ubuntu(){
#https://www.ruby-lang.org/en/installation/
sudo apt-get install -y ruby-full curl
}
