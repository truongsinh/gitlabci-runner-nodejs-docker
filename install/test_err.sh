set_env(){
 # mkdir1 $dir_my_app
  mkdir1 $dir_nodejs
}
node1(){
  set_env
 # cd $dir
  sudo apt-get install curl
  cd /tmp
  curl http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz | tar xz
  mv /tmp/node* $dir_nodejs
  sudo ln -s $dir_nodejs/bin/node /usr/local/bin/node
  sudo ln -s $dir_nodejs/bin/npm /usr/local/bin/npm
}

install(){
  node1
}

  
config(){
  trace
}
test(){ 
local  dir=/tmp/2
  mkdir1 $dir
  ensure test -d $dir
echo 1 > /tmp/1
cat1 /tmp/1
blabla
}

commander $@
