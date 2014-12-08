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
    echo $RUN > /tmp/step_name

  sudo su root <<START
  step=$(cat /tmp/step_name)
  whoami="whoami $(  whoami )"
  toilet --metal $whoami
  toilet --gay $step

  ./travis.sh $step
START
}

switch_user
