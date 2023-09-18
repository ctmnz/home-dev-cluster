#!/bin/bash

kubectl create -n istio-system secret tls argocd-tls-credential \
  --key=tls-files/argocd.127.0.0.1.nip.io.key \
  --cert=tls-files/argocd.127.0.0.1.nip.io.crt
