##
# NodeJS
#
# This creates an Ubuntu derived base image that installs a recent version of Node.js.
# As of Dec 12, 2013, Node.js version is 0.10.23
#
##

FROM ubuntu:12.10

MAINTAINER TruongSinh Tran-Nguyen <i@truongsinh.pro>

# Ensure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu quantal main universe" > /etc/apt/sources.list && apt-get update

# Install Node.js
RUN apt-get install -y software-properties-common python-software-properties python g++ make cmake \
 && add-apt-repository -y ppa:chris-lea/node.js \
 && apt-get update \
 && apt-get install -y nodejs \
 && apt-get purge -y software-properties-common python-software-properties python g++ make cmake \
 && apt-get autoremove -y

CMD node
