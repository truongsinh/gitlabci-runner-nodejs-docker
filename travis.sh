#!/usr/bin/env bash
pushd `dirname $0` >/dev/null
set -u

act=$1


set_env(){
source config.cfg
############################################## decide: MODE_DEBUG
set_mode
##############################################
chmod u+x install/*.sh
}

step(){
  local line=$1
     set +e
 mute install/${line}.sh $act;  
}

steps(){
#install ubuntu packages
while read line;do
  test -n "$line" || break
step $line
done < <( cat list.txt )
}

set_env
if [ $run = all ];then
  steps
else
  step $run
fi

#install
#step config
#step test

popd >/dev/null
