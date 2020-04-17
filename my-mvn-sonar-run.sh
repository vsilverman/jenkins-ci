#!/bin/bash

# -----------------------------------------------------------------
# This script enables continuous analysis of the quality of the app
# -----------------------------------------------------------------

mvn sonar:sonar \
    -Dsonar.host.url=https://sonarcloud.io \
    -Dsonar.projectKey=vsilverman_jenkins-ci \
    -Dsonar.organization=vsilverman-github \
    -Dsonar.login=`cat ~/SNR_LOGIN_TOKEN.txt`
