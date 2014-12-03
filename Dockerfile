FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

#Runit
RUN apt-get install -y runit 
CMD /usr/sbin/runsvdir-start





RUN echo 'deb http://il.archive.ubuntu.com/ubuntu precise main universe' > /etc/apt/sources.list && \
    echo 'deb http://il.archive.ubuntu.com/ubuntu precise-updates main universe' >> /etc/apt/sources.list && \
    apt-get update

#RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

#Runit
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y runit 
#CMD /usr/sbin/runsvdir-start


RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:mean22' | chpasswd

#Utilities
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y less net-tools inetutils-ping curl git telnet nmap socat dnsutils netcat tree htop unzip sudo






# Create a mean user
RUN mkdir -p /home/mean
RUN useradd mean -d /home/mean -s /bin/bash 
RUN cd /home/mean
RUN chown mean:mean /home/mean
RUN echo "user creation completed"

#Install mean cli
# Init the application,install dependencies and run grunt
#RUN sudo -H -u mean git clone https://github.com/linnovate/mean /home/mean/mean

#Node


#RUN cd /home/mean/mean ; sudo -u mean git checkout v0.4.0
#RUN npm install -g npm-install-retry
#RUN cd /home/mean/mean ; sudo -H -u mean npm-install-retry --wait 5000 --attempts 10
#RUN cd /home/mean/mean ; sudo -H -u mean node_modules/bower/bin/bower install -q
#RUN cd /home/mean/mean ; sudo -H -u mean node_modules/grunt-cli/bin/grunt cssmin uglify


#Configuration
ADD . /docker
RUN chmod +x /docker/install/mean.sh
RUN chmod +x /docker/install/mongo.sh
 
RUN chmod +x /docker/run.sh

RUN bash -c  /docker/install/mongo.sh
RUN bash -c  /docker/install/mean.sh


#Runit Automatically setup all services in the sv directory
#RUN for dir in /docker/sv/*; do echo $dir; chmod +x $dir/run $dir/log/run; ln -s $dir /etc/service/; done

#ENV HOME /root
#WORKDIR /root
#RUN bash -c /docker/run.sh
#RUN bash -c /docker/test.sh

#Add runit services
WORKDIR /webapps/grassroots
ADD sv /etc/service 


CMD    ["/bin/bash","echo hello world"]


EXPOSE 22 3000
