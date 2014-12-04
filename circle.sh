#!/usr/bin/env bash
#/bin/bash -c 'RUN ps aux | grep mongo'
#https://github.com/circleci?query=docker
# -p 3000:3000


docker run -d -e "SECRET_KEY_BASE=abcd1234" brownman/runner2 <<START
env
echo "SECRET_KEY_BASE: $SECRET_KEY_BASE"
START

#cd /opt/mean1/myApp;
#ls -l;
#grunt test; 
#grunt;
#sleep 10
#START

#curl --retry 10 --retry-delay 5 -v http://localhost:3000
