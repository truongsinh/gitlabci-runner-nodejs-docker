#!/usr/bin/env bash
trap trap_err ERR
set -u

trap_err(){
  exit 1
}

pushd `dirname $0` >/dev/null

#INSTALL SERVICES
chmod u+x ./install/*.sh
source ./config.cfg
commander 'echo nicer output is comming'

#install ubuntu packages
bash -c  ./install/apt.sh 


bash -c  ./install/mean.sh
bash -c  ./install/mongo.sh
bash -c  ./install/ruby.sh
bash -c  ./install/ssh.sh

popd >/dev/null
