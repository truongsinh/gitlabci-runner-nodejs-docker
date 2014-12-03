set -u
set -e

set_env(){
  export dir_myApp="$HOME"
  export myApp="$HOME/myApp" 
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
sudo npm install -g mean-cli@0.5
}

init1(){
cd $dir_myApp
mean init myApp
}

test1(){
cd $dir_myApp/myApp; 
sudo  npm install -g
sudo  npm link
grunt 
}

steps(){
set_env   
  node1
  npm1
  init1
  test1
}
steps
