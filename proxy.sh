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
  export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
  toilet --metal $( whoami )
  ./travis.sh $(cat /tmp/step_name)
START
}

sudo su -c switch_user
