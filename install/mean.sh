set -u

# NOTE : Permission of myApp is 777
set_env1(){
 # mkdir1 $dir_my_app
  mkdir1 $dir_nodejs
  SUDO=''
}
node1(){
   cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  mv /tmp/node-v* /tmp/nodejs && \
  npm install -g npm && \
  echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc
}

node0(){
 # cd $dir
 # apt1 curl 
 sudo apt-get install -y curl
 #install only if not-already installed
  cd /tmp
  curl http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz | tar xz
  mv /tmp/node* $dir_nodejs
  $SUDO ln -s $dir_nodejs/bin/node /usr/bin/node
  $SUDO ln -s $dir_nodejs/bin/npm /usr/bin/npm
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
$SUDO  npm install -g | pv
trace $SUDO  npm link
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
#ensure "test -L $PATH_BIN/npm"
#ensure "test -L $PATH_BIN/node"
#ensure which npm
#ensure whereis npm
#ensure npm
#ensure sudo npm
trace
}

test_config(){
 # test -d $dir_my_app
 # ls $dir_my_app
trace ls -l $dir_my_app
 # cd $dir_my_app
 # ( grunt test  ) || { trace imagine all tests are passing!; }
}

test_install(){
  trace
}
commander $@
