#change user to root
#RUN ./fix/permission.sh
#make travis and docker passing step after step together
#RUN ./travis.sh
echo "---------------------"
echo "dir_start:     $PWD"
echo "---------------------"

sudo apt-get install -y toilet figlet 1>/dev/null

switch_user(){
  source config.cfg
 # ln -s ./travis.sh /tmp
    # /tmp/travis.sh

  sudo su root - <<START
  echo "whoami $(  whoami )"
  toilet --metal $RUN
  ./travis.sh $RUN
START
}

switch_user
