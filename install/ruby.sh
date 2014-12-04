#https://gitlab.com/gitlab-org/gitlab-ci-runner/

ruby19(){
# Update your packages and install the ones that are needed to compile Ruby
sudo  apt-get update -y
sudo  apt-get install -y wget curl gcc libxml2-dev libxslt-dev libcurl4-openssl-dev libreadline6-dev libc6-dev libssl-dev make build-essential zlib1g-dev openssh-server git-core libyaml-dev postfix libpq-dev libicu-dev

# Download Ruby and compile it
mkdir /tmp/ruby && cd /tmp/ruby && curl --progress http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.gz | tar xz
cd /tmp/ruby/ruby-1.9.3-p392 && ./configure --disable-install-rdoc && make && sudo make install
}

ruby20(){
# Download Ruby and compile it
sudo apt-get update -y
sudo apt-get install -y wget curl gcc libxml2-dev libxslt-dev libcurl4-openssl-dev libreadline6-dev libc6-dev libssl-dev make build-essential zlib1g-dev openssh-server git-core libyaml-dev postfix libpq-dev libicu-dev

mkdir /tmp/ruby && cd /tmp/ruby
curl --progress ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p353.tar.gz | tar xz
cd ruby-2.0.0-p353
./configure --disable-install-rdoc
make
sudo make install
}
# don't install ruby rdocs or ri:
install_bundler(){
echo "gem: --no-rdoc --no-ri" | sudo tee /usr/local/etc/gemrc
sudo  gem install bundler
}

ruby20
bundler
