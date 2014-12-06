#must install package sudo on Dockerfile

install1(){
while read line;do
#apt-get search $line
#fortune-mode

sudo apt-get install $line
done < <( cat <<START
cowsay 
START
)
}

config(){
  which cowsay
  whereis cowsay
}

test(){
  echo
  /usr/games/cowsay mu
  #$(fortune -s)
}

commander $@
