#change user to root
#RUN ./fix/permission.sh
#make travis and docker passing step after step together
#RUN ./travis.sh
echo "---------------------"
echo "dir_start:     $PWD"
echo "---------------------"

sudo apt-get install -y toilet figlet 1>/dev/null
where_am_i(){
echo $( cd `dirname  $PWD`;echo $PWD; )
}
switch_user(){
  
 source config.cfg
 dir_self=$( where_am_i )
 ln -s $dir_self/travis.sh /tmp
 sudo su -c 'whoami'
 #sudo su -c '/tmp/travis.sh'
 
 }

 switch_user
