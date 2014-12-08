#!/usr/bin/env bash
toilet --gay "I'm: $(whoami)"
where_am_i () 
    { 
        local file=${1:-"${BASH_SOURCE[1]}"};
        local rpath=$(readlink -m $file);
        local rcommand=${rpath##*/};
        local str_res=${rpath%/*};
        local dir_self="$( cd $str_res  && pwd )";
        echo "$dir_self"
    }



pushd `where_am_i $0` >/dev/null
set -u
export RUN=$1


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
toilet --gay $line

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
