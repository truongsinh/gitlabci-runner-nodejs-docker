#!/usr/bin/env bash
pushd `dirname $0` >/dev/null
set -u
export RUN=$1
  toilet --gay $RUN


set_env(){
source config.cfg
############################################## decide: MODE_DEBUG
set_mode
permission_fix
env1
##############################################
chmod u+x install/*.sh
}

step(){
set -e
set -u
local line=$1

 print_func $line
 print_title INSTALL
 mute install/${line}.sh install;
 
  print_title TEST_INSTALL
 commander install/${line}.sh test_install;
 
  print_title CONFIG
 commander install/${line}.sh config;  
 
print_title TEST_CONFIG
 commander install/${line}.sh test_config;
}

steps(){
#install ubuntu packages
while read line;do
  test -n "$line" || break
step $line
done < <( cat list.txt )
}

set_env
if [ $RUN = all ];then
  steps
else
  step $RUN
fi

#install
#step config
#step test

popd >/dev/null
