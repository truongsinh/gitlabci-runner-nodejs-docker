#change user to root
#RUN ./fix/permission.sh
#make travis and docker passing step after step together
#RUN ./travis.sh
echo "---------------------"
echo "dir_start:     $PWD"
echo "---------------------"

 
switch_user(){
  source config.cfg
  ln -s ./travis.sh /tmp
  
  sudo su root <<START
  echo "whoami $(  whoami )"
  ls
   /tmp/travis.sh
START
}

switch_user
