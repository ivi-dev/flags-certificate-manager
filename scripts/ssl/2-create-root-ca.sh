#!/bin/bash


ROOT_CA_PATH=/etc/ssl/rootCA
DOMAIN_NAME=secure-cert.com
COUNTRY=BG
CITY=Sofia

# 1. Create the root CA's directory if it doesn't already exist
if [ ! -d $ROOT_CA_PATH ]; then 
	mkdir $ROOT_CA_PATH
fi

# 2.Generate the root CA's private key and certificate
openssl req -x509 \
            -sha256 \
	        -days 356 \
            -nodes \
            -newkey rsa:2048 \
            -subj "/CN=$DOMAIN_NAME/C=$COUNTRY/L=$CITY" \
            -keyout $ROOT_CA_PATH/root.key \
	        -out $ROOT_CA_PATH/root.crt
