#!/usr/bin/env bash
pushd `dirname $0` >/dev/null
set -u

set_env(){
source config.cfg
trap trap_err ERR
chmod u+x install/*.sh
}

step(){
#install ubuntu packages
local act=$1
while read line;do
  test -n "$line" || break
   { set -e; commander install/${line}.sh; $act } 
done < <( cat list.txt )
}

set_env
step install
step config
step test

popd >/dev/null
