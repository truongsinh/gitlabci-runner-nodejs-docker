

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
mean init myApp
cd myApp; 
sudo  npm install -g
sudo  npm link
}

test1(){
cd $HOME/myApp;
grunt 
}

steps(){
  myApp=$HOME/myApp
  cd $HOME
  
  node1
  npm1
  init1
  test1
}
steps
