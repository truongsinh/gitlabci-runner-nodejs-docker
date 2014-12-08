#change user to root
#RUN ./fix/permission.sh
#make travis and docker passing step after step together
#RUN ./travis.sh
echo "---------------------"
echo "dir_start:     $PWD"
echo "---------------------"

run1(){
    ./travis.sh
}
switch_user(){
  source config.cfg
  sudo su root <<START
  echo "whoami $(  whoami )"
  run1
START
}

switch_user
