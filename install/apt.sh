#must install package sudo on Dockerfile

install(){
while read line;do
apt-get search $line
sudo apt-get install $line
done < <( cat <<START
cowsay 
fortune-mode
START
)
}

config(){
  which cowsay
  whereis cowsay
}

test(){
  echo
  /usr/games/cowsay $(fortune -s)
}

commander $@
