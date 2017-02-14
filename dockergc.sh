#!/bin/sh

# set DOCKER to sudo docker if you need to run docker with root permissions
DOCKER="docker"
#DOCKER="sudo docker"

# remove docker instances that have status=exited
for c in $($DOCKER ps -a -q -f status=exited)
do
    $DOCKER rm -v $c
done


# remove dangling docker images
for i in $($DOCKER images -f "dangling=true" -q)
do
    $DOCKER rmi $i
done

