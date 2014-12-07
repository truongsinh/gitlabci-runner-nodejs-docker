# https://gitlab.com/gitlab-org/gitlab-ci-runner/
#https://gist.github.com/Gurpartap/ef78033f059cf593e4f0
set -u

ruby20(){
sudo apt-get update -y
sudo apt-get install -y curl wget curl gcc libxml2-dev libxslt-dev libcurl4-openssl-dev libreadline6-dev libc6-dev libssl-dev make build-essential zlib1g-dev openssh-server git-core libyaml-dev postfix libpq-dev libicu-dev

mkdir /tmp/ruby && cd /tmp/ruby
curl --progress ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p353.tar.gz | tar xz
cd ruby-2.0.0-p353
./configure --prefix=$dir_base --disable-install-rdoc --disable-install-ri
make
make install
}

ruby21(){
sudo  apt-get update -qq && \
    apt-get install -y make curl -qq && \
    apt-get clean && \
    curl -sSL "https://github.com/postmodern/ruby-install/archive/master.tar.gz" -o /tmp/ruby-install-master.tar.gz && \
    cd /tmp && tar -zxvf ruby-install-master.tar.gz && \
    cd /tmp/ruby-install-master && make install && \
    apt-get update && \
    echo "gem: --no-rdoc --no-ri" >> ~/.gemrc && \
    ruby-install -i /usr/local/ ruby -- --disable-install-rdoc --disable-install-ri && \
    gem update --system && \
    gem install bundler
}
# Update your packages and install the ones that are needed to compile Ruby
# Download Ruby and compile it

# don't install ruby rdocs or ri:
install_bundler(){
echo "gem: --no-rdoc --no-ri" | sudo tee /usr/local/etc/gemrc
gem install bundler
}


install_gitlab_repo(){
#NEEDED: curl
local dir="$dir_gitlab_ci_runner_repo"
mkdir1 $dir

cd /tmp
curl --silent -L https://gitlab.com/gitlab-org/gitlab-ci-runner/repository/archive.tar.gz | tar xz
mv /tmp/gitlab-ci-runner.git $dir
cd $dir
bundle install --deployment
}

ensure_bundler_exist(){
ensure  type bundler
ensure  whereis bundler
ensure which bundler
}


install(){
#mute install_ruby_ubuntu
ruby21
#mute travis_only
}

config(){
  install_bundler
  install_gitlab_repo
}
test1(){
  ensure_bundler_exist
}

commander $@
