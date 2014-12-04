# Download Ruby and compile it

# Update your packages and install the ones that are needed to compile Ruby
#RUN apt-get update -y
#RUN apt-get upgrade -y
#RUN apt-get install -y curl libxml2-dev libxslt-dev libcurl4-openssl-dev libreadline6-dev libssl-dev patch build-essential zlib1g-dev openssh-server libyaml-dev libicu-dev

# Download Ruby and compile it

sudo apt-get update -y
sudo apt-get install -y wget curl gcc libxml2-dev libxslt-dev libcurl4-openssl-dev libreadline6-dev libc6-dev libssl-dev make build-essential zlib1g-dev openssh-server git-core libyaml-dev postfix libpq-dev libicu-dev
mkdir /tmp/ruby
cd /tmp/ruby
# curl --silent ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.tar.gz | tar xz
curl -s http://ftp.ruby-lang.org/pub/ruby/ruby-2.0-stable.tar.bz2 | tar xj --strip-components=1
cd /tmp/ruby/ruby-2.0.0-p481
./configure --disable-install-rdoc 
sudo make install
rm -rf /tmp/ruby

# don't install ruby rdocs or ri:
echo "gem: --no-rdoc --no-ri" >> /usr/local/etc/gemrc
sudo  gem install bundler
