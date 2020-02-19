#!/bin/bash

docker build -t shib047/node-web-app 
docker push shib047/node-web-app
cd ci/
kubectl create -f helloworld.yml 
kubectl create -f ingress.yml
