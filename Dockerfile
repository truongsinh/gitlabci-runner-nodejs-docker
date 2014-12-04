FROM ubuntu:12.04
#FROM ubuntu:14.04



##################################### ENV VARS
ENV DEBIAN_FRONTEND noninteractive
###################################### ###################################### source.list
RUN echo 'deb http://il.archive.ubuntu.com/ubuntu precise main universe' > /etc/apt/sources.list && \
    echo 'deb http://il.archive.ubuntu.com/ubuntu precise-updates main universe' >> /etc/apt/sources.list

RUN apt-get update
###################################### avoid warning: upstart (restarting deamons)
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d
#Runit Automatically setup all services in the sv directory
###################################### ####################################### packages
RUN apt-get install -y less net-tools inetutils-ping curl git telnet nmap socat dnsutils netcat tree htop unzip sudo runit
######################################## Runit
CMD /usr/sbin/runsvdir-start
######################################## ####################################### install meanio prerequisites 
#CP
ADD . /docker
#PERMIT
RUN chmod +x /docker/install/mean.sh
RUN chmod +x /docker/install/mongo.sh
RUN chmod +x /docker/install/ssh.sh
#INSTALL SERVICES
RUN bash -c  /docker/install/mean.sh
RUN bash -c  /docker/install/mongo.sh
RUN bash -c  /docker/install/ssh.sh
###############################################################################Add runit services
ADD sv /etc/service 
#########################################               ######################################
#RUN bash -c /docker/run.sh
#RUN bash -c /docker/test.sh
RUN env > /tmp/env.txt
CMD    ["/bin/bash","mongod --fork -f /etc/mongod.conf; cd /opt/mean1/myApp; grunt test"]
EXPOSE 22 3000 27017
