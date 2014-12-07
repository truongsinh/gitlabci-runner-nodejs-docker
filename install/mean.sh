set -u

# NOTE : Permission of myApp is 777
set_env1(){
 # mkdir1 $dir_my_app
  mkdir1 $dir_nodejs
  SUDO=''
}


node1(){
 # cd $dir
 # apt1 curl 
 sudo apt-get install -y curl
 #install only if not-already installed
  cd /tmp
  curl http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz | tar xz
  mv /tmp/node* $dir_nodejs
  ln -s $dir_nodejs/bin/node $PATH_BIN/node
  ln -s $dir_nodejs/bin/npm $PATH_BIN/npm
}

npm1(){
$SUDO npm update -g npm
$SUDO npm install -g grunt-cli bower
$SUDO npm install -g mean-cli@${VER_MEAN_CLI}
}






scaffold(){
 #grunt test
 cd $path_my_app
 mean init $APP_NAME
 cd $dir_my_app; 
 $SUDO  npm install -g
 $SUDO  npm link
}


#cmd_start="${1:-before}" 
#eval "$cmd_start" 

install(){
  set_env1
  node1
  npm1
  scaffold
}

config(){
  #env | grep opt
trace
}

test_install(){
ensure "test -L $PATH_BIN/npm"
ensure "test -L $PATH_BIN/node"
ensure which npm
ensure whereis npm
#ensure npm
#ensure sudo npm
}

test_config(){
 # test -d $dir_my_app
 # ls $dir_my_app
 ls -l $dir_my_app
 # cd $dir_my_app
 # ( grunt test  ) || { trace imagine all tests are passing!; }
}


commander $@
