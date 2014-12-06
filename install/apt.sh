#must install package sudo on Dockerfile

install(){
while read line;do
#apt-get search $line
#fortune-mode

sudo apt-get install -y $line
done < <( cat <<START
cowsay
ping
START
)
}

config(){
  which cowsay
  whereis cowsay
}

test(){
  /usr/games/cowsay hi
  #$(fortune -s)
}

commander $@
