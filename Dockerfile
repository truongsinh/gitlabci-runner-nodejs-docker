FROM ubuntu:12.04
#FROM ubuntu:12.04
##################################### ENV VARS
ENV DEBIAN_FRONTEND noninteractive
ENV MODE_DEBUG false
###################################### avoid warning: upstart (restarting deamons)
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d
###################################### ####################################### packages
ADD . /docker

CMD /usr/sbin/runsvdir-start
############################################### install stuff we can test using travis.ci
RUN chmod +x /docker/travis.sh
RUN  /docker/travis.sh
################################################ GITLAB RUNNER CODE GOES HERE
ADD sv /etc/service 

# Set an utf-8 locale
#LANG="en_US.UTF-8"


# Prepare a known host file for non-interactive ssh connections
RUN mkdir -p /root/.ssh
RUN touch /root/.ssh/known_hosts

# Install the runner
RUN curl --silent -L https://gitlab.com/gitlab-org/gitlab-ci-runner/repository/archive.tar.gz | tar xz
RUN cd gitlab-ci-runner.git && bundle install --deployment

WORKDIR /gitlab-ci-runner.git

# When the image is started add the remote server key, set up the runner and run it
CMD ssh-keyscan -H $GITLAB_SERVER_FQDN >> /root/.ssh/known_hosts && bundle exec ./bin/setup_and_run
