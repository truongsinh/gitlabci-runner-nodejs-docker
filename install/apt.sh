#must install package sudo on Dockerfile

install(){}{
sudo apt-get install <<START
cowsay
fortune-mod
START
}

config(){
  which cowsay
  whereis cowsay
}

test(){
  echo
  cowsay $(fortune -s)
}

commander $@
