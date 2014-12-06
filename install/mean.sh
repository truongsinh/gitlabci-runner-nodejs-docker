

#set -e
# NOTE : Permission of myApp is 777
set_env(){
 # mkdir1 $dir_my_app
  mkdir1 $dir_nodejs
}


node1(){
 # cd $dir
  sudo apt-get install curl
  cd /tmp
  curl http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz | tar xz
  mv /tmp/node* $dir_nodejs
  sudo ln -s $dir_nodejs/bin/node /usr/local/bin/node
  sudo ln -s $dir_nodejs/bin/npm /usr/local/bin/npm
}

npm1(){
sudo npm update -g npm
sudo npm install -g grunt-cli bower
sudo npm install -g mean-cli@${VER_MEAN_CLI}
}

scaffold1(){
cd $path_my_app
mean init $APP_NAME
}



before(){
   node1
  npm1
  
}
after(){
 
cd $dir_my_app; 
sudo  npm install -g
sudo  npm link
#grunt test
}


#cmd_start="${1:-before}" 
#eval "$cmd_start" 

install(){
set_env
before
scaffold1
after
}
config(){
  #env | grep opt
    ls $dir_my_app

}
test(){
  ensure test -d $dir_my_app
  cd $dir_my_app
  ( grunt test ) || { trace imagine all tests are passing!; }
}

commander $@
