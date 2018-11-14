#!/bin/bash

docker run \
  --rm \
  --name my-jenkins-ci \
  -u root \
  -p 8080:8080 \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$HOME"/github.com/vsilverman:/home \
  jenkinsci/blueocean
