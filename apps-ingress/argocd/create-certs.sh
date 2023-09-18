#!/bin/bash

mkdir tls-files
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=nip Inc./CN=nip.io' -keyout tls-files/nip.io.key -out tls-files/nip.io.crt

openssl req -out tls-files/argocd.127.0.0.1.nip.io.csr -newkey rsa:2048 -nodes -keyout tls-files/argocd.127.0.0.1.nip.io.key -subj "/CN=argocd.127.0.0.1.nip.io/O=homecluster organization"
openssl x509 -req -sha256 -days 365 -CA tls-files/nip.io.crt -CAkey tls-files/nip.io.key -set_serial 0 -in tls-files/argocd.127.0.0.1.nip.io.csr -out tls-files/argocd.127.0.0.1.nip.io.crt


### generate client cert
openssl req -out tls-files/client.nip.io.csr -newkey rsa:2048 -nodes -keyout tls-files/client.nip.io.key -subj "/CN=client.nip.io/O=client organization"
openssl x509 -req -sha256 -days 365 -CA tls-files/nip.io.crt -CAkey tls-files/nip.io.key -set_serial 1 -in tls-files/client.nip.io.csr -out tls-files/client.nip.io.crt



