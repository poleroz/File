#!/bin/sh
docker stop $(docker ps -q)
cd /home/ubuntu/WORK/test-build
docker build -t abc12 .
docker run -d -p 8000:80 abc12
