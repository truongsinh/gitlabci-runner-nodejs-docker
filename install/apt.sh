#must install package sudo on Dockerfile

install(){}{
sudo apt-get install <<START
cowsay
fortune-mod
START
}

config(){
  echo
}

test(){
  echo
}

commander $@
