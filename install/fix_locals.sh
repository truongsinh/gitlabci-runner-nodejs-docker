
ubuntu1304(){
# Set the locale
sudo locale-gen en_US.UTF-8  
export LANG=en_US.UTF-8  
export LANGUAGE=en_US:en  
export LC_ALL=en_US.UTF-8  
#RUN echo 'LC_ALL="en_US.UTF-8"' >> /etc/default/locale
#RUN locale-gen en_US.UTF-8
#RUN update-locale LANG=en_US.UTF-8
}




install(){
ubuntu1304
}

config(){
  trace
}

test1(){
  trace
}
commander $@
