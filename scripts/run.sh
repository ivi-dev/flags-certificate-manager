#!/bin/bash

CONTAINER_NAME=flags-cert-manager

docker rm -f $CONTAINER_NAME
docker run -d \
       --mount type=volume,src=flags-cert-manager-private,dst=/etc/ssl/private/flags \
       --mount type=volume,src=flags-cert-manager-public,dst=/etc/ssl/certs/flags \
       --name $CONTAINER_NAME $CONTAINER_NAME:latest
