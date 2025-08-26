#!/bin/bash

ROOT_CA_PATH=/etc/ssl/rootCA
CERT_PROJ_DIR_PRIVATE=/etc/ssl/private/flags
CERT_PROJ_DIR_PUBLIC=/etc/ssl/certs/flags
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
cp $ROOT_CA_PATH/root.crt $CERT_PROJ_DIR_PUBLIC/root.crt

# 3. Combine the CA's key and root certificate into a single file
cat $ROOT_CA_PATH/root.key $ROOT_CA_PATH/root.crt > \
	$CERT_PROJ_DIR_PRIVATE/ca-cert-n-key-combined.pem
chmod 744 $CERT_PROJ_DIR_PRIVATE/ca-cert-n-key-combined.pem