#!/bin/bash

CERT_PROJ_DIR=/etc/ssl/certs/self-signed
CERT_PROJ_DIR_PRIVATE=/etc/ssl/private/flags
CERT_PROJ_DIR_PUBLIC=/etc/ssl/certs/flags
CERT_ROOT_CA_PATH=/etc/ssl/rootCA

# 1. Create the project directory and its subdirectories if they don't already exist
[ ! -d $CERT_PROJ_DIR ] && mkdir -p $CERT_PROJ_DIR
[ ! -d $CERT_PROJ_DIR_PRIVATE ] && mkdir -p $CERT_PROJ_DIR_PRIVATE
[ ! -d $CERT_PROJ_DIR_PUBLIC ] && mkdir -p $CERT_PROJ_DIR_PUBLIC

# 2. Create the Server Private Key
openssl genrsa -out $CERT_PROJ_DIR_PRIVATE/private.key 2048

# 3. Copy over the Certificate Signing Request (CSR) Configuration
cp /root/csr.conf $CERT_PROJ_DIR

# 4. Generate Certificate Signing Request (CSR)
openssl req -new \
	-key $CERT_PROJ_DIR_PRIVATE/server.key \
	-out $CERT_PROJ_DIR/request.csr \
	-config $CERT_PROJ_DIR/csr.conf

# 5. Create a certificate configuration
cp /root/cert.conf $CERT_PROJ_DIR/cert.conf

# 6. Generate a self-signed certificate
openssl x509 -req \
		-in $CERT_PROJ_DIR/request.csr \
    	-CA $CERT_ROOT_CA_PATH/root.crt \
		-CAkey $CERT_ROOT_CA_PATH/root.key \
    	-CAcreateserial \
		-out $CERT_PROJ_DIR_PUBLIC/cert.crt \
    	-days 365 \
    	-sha256 \
		-extfile $CERT_PROJ_DIR/cert.conf
