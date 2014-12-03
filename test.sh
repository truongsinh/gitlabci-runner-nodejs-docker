#!/usr/bin/env bash
exec 1>&2
docker run -d -p brownman/runner2 /bin/bash -c 'RUN ps aux | grep mongo'
