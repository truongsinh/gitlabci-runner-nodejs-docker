#!/usr/bin/env bash
#/bin/bash -c 'RUN ps aux | grep mongo'
#https://github.com/circleci?query=docker

docker run -d -p 3000:3000 -e "SECRET_KEY_BASE=abcd1234" brownman/runner2:$CIRCLE_SHA1  cd /opt/mean/myApp; grunt test; grunt; sleep 10
curl --retry 10 --retry-delay 5 -v http://localhost:3000
