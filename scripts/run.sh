#!/bin/bash

CONTAINER_NAME=flags-cert-manager

docker rm -f $CONTAINER_NAME
docker run -d \
       --mount type=volume,src=flags-cert-manager-private,dst=/etc/ssl/certs/self-signed/private \
       --mount type=volume,src=flags-cert-manager-public,dst=/etc/ssl/certs/self-signed/public \
       --name $CONTAINER_NAME $CONTAINER_NAME:latest
