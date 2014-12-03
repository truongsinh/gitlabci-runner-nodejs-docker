#!/usr/bin/env bash
exec 2>&1
docker run -d -p brownman/runner2 /bin/bash -c 'RUN ps aux | grep mongo'
