#!/usr/bin/env bash
trap trap_err ERR
set -u

trap_err(){
  echo $FUNCNAME
  exit 1
}

pushd `dirname $0` >/dev/null

#INSTALL SERVICES
chmod u+x ./install/*.sh
source ./config.cfg
commander 'echo nicer output is comming'

#install ubuntu packages
commander ./install/apt.sh 

commander ./install/mean.sh
commander ./install/mongo.sh
commander ./install/ruby.sh
commander ./install/ssh.sh

popd >/dev/null
