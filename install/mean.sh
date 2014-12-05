set -u
set -e
# NOTE : Permission of myApp is 777
mkdir1(){
  local dir="$1" 
  test -d $dir || { sudo mkdir -p $dir; sudo chmod 777 $dir;  }
}

set_env(){
  export dir_myApp="/opt/mean1"
  export dir_nodejs="/opt/nodejs"

  mkdir1 $dir_myApp
  mkdir1 $dir_nodejs

  export ver='0.9.3'
}

node1(){
  local dir=$dir_nodejs
  
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
cd $dir_myApp/myApp; 
sudo  npm install -g
sudo  npm link
#grunt test
}

before(){
   node1
  npm1
  init1
}


#cmd_start="${1:-before}" 
#eval "$cmd_start" 

install(){
set_env
before
after
}
config(){
  echo
}
test(){
  echo
}

commander $@
