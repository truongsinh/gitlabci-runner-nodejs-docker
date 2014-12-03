#!/usr/bin/env bash

docker run -d -p 3000:3000 brownman/runner2 /bin/bash -c 'RUN ps aux | grep mongo'
