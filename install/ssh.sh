#RUN mkdir /var/run/sshd
#RUN echo 'root:mean22' | chpasswd
#SSHD
sudo  apt-get install -y openssh-server
sudo mkdir -p /var/run/sshd 
echo 'root:root' | sudo tee chpasswd
sudo sed -i "s/session.*required.*pam_loginuid.so/#session    required     pam_loginuid.so/" /etc/pam.d/sshd
sudo sed -i "s/PermitRootLogin without-password/#PermitRootLogin without-password/" /etc/ssh/sshd_config
