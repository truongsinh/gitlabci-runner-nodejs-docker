
install(){
trace Fix upstart under a virtual host https://github.com/dotcloud/docker/issues/1024
sudo  dpkg-divert --local --rename --add /sbin/initctl 
sudo rm -f /sbin/initctl 
sudo ln -s /bin/true /sbin/initctl
}

config(){
  trace
}

test_install(){
  trace
}
test_config(){
  trace
}
commander $@
#echo "#!/bin/sh\nexit 0" | sudo too /usr/sbin/policy-rc.d
