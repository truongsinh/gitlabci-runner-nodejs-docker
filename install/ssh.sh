#RUN mkdir /var/run/sshd
#RUN echo 'root:mean22' | chpasswd
#SSHD
install(){
sudo  apt-get install -y openssh-server

}

config(){
  trace ''
 # commander sudo service sshd start
#sudo mkdir -p /var/run/sshd 
#echo 'root:root' | sudo tee chpasswd

#sudo su root <<START
#START

#sudo sed -i "s/session.*required.*pam_loginuid.so/#session    required     pam_loginuid.so/" /etc/pam.d/sshd
#sudo sed -i "s/PermitRootLogin without-password/#PermitRootLogin without-password/" /etc/ssh/sshd_config

}

test_install(){
  trace
}
test_config(){
    ( sudo netstat -ntlp | grep ssh ) || { trace imagine sshd is working; }

}


commander $@
