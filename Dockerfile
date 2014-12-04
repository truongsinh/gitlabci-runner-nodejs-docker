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

#CMD    ["/bin/bash","mongod --fork -f /etc/mongod.conf; cd /opt/mean1/myApp; grunt test"]
#EXPOSE 22 3000 27017
################################################ GITLAB RUNNER CODE GOES HERE

ENV DEBIAN_FRONTEND noninteractive

# Update your packages and install the ones that are needed to compile Ruby
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y curl libxml2-dev libxslt-dev libcurl4-openssl-dev libreadline6-dev libssl-dev patch build-essential zlib1g-dev openssh-server libyaml-dev libicu-dev

# Download Ruby and compile it
RUN mkdir /tmp/ruby
RUN cd /tmp/ruby && curl --silent ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.tar.gz | tar xz
RUN cd /tmp/ruby/ruby-2.0.0-p481 && ./configure --disable-install-rdoc && make install

RUN gem install bundler

# Set an utf-8 locale
RUN echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

# Prepare a known host file for non-interactive ssh connections
RUN mkdir -p /root/.ssh
RUN touch /root/.ssh/known_hosts

# Install the runner
RUN curl --silent -L https://gitlab.com/gitlab-org/gitlab-ci-runner/repository/archive.tar.gz | tar xz
RUN cd gitlab-ci-runner.git && bundle install --deployment

WORKDIR /gitlab-ci-runner.git

# When the image is started add the remote server key, set up the runner and run it
CMD ssh-keyscan -H $GITLAB_SERVER_FQDN >> /root/.ssh/known_hosts && bundle exec ./bin/setup_and_run
