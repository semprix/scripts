#!/bin/bash
certname=`challenger`

echo "===> Generating an SSL private key to sign your certificate..."
openssl genrsa -des3 -out $certname.key 1024

echo "===> Generating a Certificate Signing Request..."
openssl req -new -key $certname.key -out myssl.csr

echo "===> Removing passphrase from key (for nginx)..."
cp myssl.key $certname.key.org
openssl rsa -in $certname.key.org -out $certname.key
rm $certname.key.org

echo "===> Generating certificate..."
openssl x509 -req -days 365 -in $certname.csr -signkey $certname.key -out $certname.crt

echo "===> Copying certificates to /usr/local/etc/nginx/ssl/certs"
mkdir -p  /usr/local/etc/nginx/ssl/certs
cp $certname.crt /usr/local/etc/nginx/ssl/certs

echo "===> Copying keys to /usr/local/etc/nginx/ssl/private/"
mkdir -p  /usr/local/etc/nginx/ssl/private
cp $certname.key /etc/ssl/private/
