#!/usr/bin/env bash
exec 1>&2
docker run -d brownman/runner2 /bin/bash -c 'RUN ps aux | grep mongo'
