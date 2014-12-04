#!/usr/bin/env bash
pushd `dirname $0` >/dev/null
set -u

set_env(){
source config.cfg
trap trap_err ERR
chmod u+x install/*.sh
}

steps(){
#install ubuntu packages
while read line;do
  test -n "$line" || break
  commander install/${line}.sh 
done < <( cat list.txt )
}

set_env
steps

popd >/dev/null
