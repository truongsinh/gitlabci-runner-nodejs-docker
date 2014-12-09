#NOTE: we have to add /etc/rsyslog.conf using Dockerfile:ADD command
#http://dockerfile.github.io/#/ruby
# https://gitlab.com/gitlab-org/gitlab-ci-runner/
#https://gist.github.com/Gurpartap/ef78033f059cf593e4f0
set -u


ruby_env(){
# install ruby, bundler
export INSTALL_RUBY_VERSION=2.1.0
export RBENV_ROOT=${HOME}/.rbenv
export PATH=${RBENV_ROOT}/bin:${PATH}
wget -qO - https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash

rbenv install $INSTALL_RUBY_VERSION
rbenv global $INSTALL_RUBY_VERSION
echo "eval \"\$(rbenv init -)\"" >> $HOME/.profile
. $HOME/.profile && gem install bundler
}




install_gitlab_repo(){
#NEEDED: curl
local dir="$dir_gitlab_ci_runner_repo"
mkdir1 $dir

cd /tmp
curl --silent -L https://gitlab.com/gitlab-org/gitlab-ci-runner/repository/archive.tar.gz | tar xz
mv /tmp/gitlab-ci-runner.git $dir
cd $dir
( bundle install --deployment ) || {  trace error on using bundler; }
}

ensure_bundler_exist(){
ensure  type bundler
ensure  whereis bundler
ensure which bundler
}


install(){
#mute install_ruby_ubuntu
ruby_env
#mute travis_only
}

config(){
 # trace install_bundler
  #trace install_gitlab_repo
  trace
}
 
test_install(){
  trace
}
test_config(){
  trace
# ensure_bundler_exist
}

commander $@
