#!/bin/bash/usr/sbin/sshd -D & LC_ALL=C.UTF-8 sudo -H -u mongodb mongod --nojournal & cd /home/mean/mean ; sleep 5s ;  sudo -u mean node server.js
