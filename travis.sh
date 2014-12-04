#!/usr/bin/env bash
pushd `dirname $0` >/dev/null



trap trap_err ERR
set -u

trap_err(){
  echo $FUNCNAME
  exit 1
}


#INSTALL SERVICES
chmod u+x install/*.sh
source config.cfg
commander 'echo nicer output is comming'

#install ubuntu packages
while read line;do
  test -n "$line" || break
  commander install/${line}.sh 
done < <( cat list.txt )



popd >/dev/null
