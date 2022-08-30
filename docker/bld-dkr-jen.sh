#!/bin/bash

JENKINS_VERSION=2.346.3

docker build -t myjenkins-blueocean:${JENKINS_VERSION}-1 .