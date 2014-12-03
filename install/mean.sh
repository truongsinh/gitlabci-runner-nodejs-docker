set -u
set -e

set_env(){
  export dir_myApp="/opt/mean1"
  test -d $dir_myApp || { sudo mkdir -p $dir_myApp; sudo chmod 777 $dir_myApp;  }
 
  export myApp="$dir_myApp/myApp" 
  export ver='0.9.3'
}

node1(){
#Node
  local dir='/tmp'
  cd $dir
  curl http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz | tar xz
  mv $dir/node* $dir/node && \
    sudo ln -s $dir/node/bin/node /usr/local/bin/node && \
    sudo ln -s $dir/node/bin/npm /usr/local/bin/npm
}

npm1(){
sudo npm update -g npm
sudo npm install -g grunt-cli bower
sudo npm install -g mean-cli@${ver}
}

init1(){
cd $dir_myApp
mean init myApp
}

after(){
set_env
cd $dir_myApp/myApp; 
sudo  npm install -g
sudo  npm link
#grunt test
}

before(){
set_env   
  node1
  npm1
  init1
}


#cmd_start="${1:-before}" 
#eval "$cmd_start" 
before
after
