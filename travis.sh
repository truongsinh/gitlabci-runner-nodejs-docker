#!/usr/bin/env bash
pushd `dirname $0` >/dev/null
set -u

RUN=${RUN:-all}


set_env(){
source config.cfg
############################################## decide: MODE_DEBUG
set_mode
init_cfg
##############################################
chmod u+x install/*.sh
}

step(){
  local line=$1
 set -e
 set -u
 print_line
 mute install/${line}.sh install;
 commander install/${line}.sh config;  
 commander install/${line}.sh test;  
 print_line
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
