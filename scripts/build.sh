#!/bin/bash

IMG_NAME=flags-cert-manager:latest
CONTAINER_NAME=flags-cert-manager

docker rm -f $CONTAINER_NAME
docker image rm -f $IMG_NAME
docker build -t $IMG_NAME $1