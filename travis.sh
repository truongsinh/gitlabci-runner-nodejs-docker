#!/usr/bin/env bash
pushd `dirname $0` >/dev/null
set -u

act=$1


set_env(){
source config.cfg

chmod u+x install/*.sh
}

step(){
#install ubuntu packages
local act=$1
while read line;do
  test -n "$line" || break
   { $cmd_trap_err; commander install/${line}.sh $act; } 
done < <( cat list.txt )
}

set_env
step $act
#install
#step config
#step test

popd >/dev/null
