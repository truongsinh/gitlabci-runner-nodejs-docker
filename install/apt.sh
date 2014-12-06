#must install package sudo on Dockerfile

install(){
while read line;do
sudo apt-get install $line
done < <( cat <<START
cowsay 
fortune-mod
START
)
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
