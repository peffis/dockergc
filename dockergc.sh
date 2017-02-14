#!/bin/sh

# set DOCKER to sudo docker if you need to run docker with root permissions
DOCKER=docker
#DOCKER=sudo docker

# remove docker instances that have status=exited
$DOCKER rm -v $($DOCKER ps -a -q -f status=exited)

# remove dangling docker images
$DOCKER rmi $($DOCKER images -f "dangling=true" -q)
