#!/bin/bash

# -----------------------------------------------------------------
# This script enables continuous analysis of the quality of the app
# -----------------------------------------------------------------

mvn sonar:sonar \
    -Dsonar.host.url=https://sonarcloud.io \
    -Dsonar.projectKey=vsilverman_jenkins-ci \
    -Dsonar.organization=vsilverman-github \
    -Dsonar.login=905b6ea8dd4be5fa69abad2e24a59a0b9c43130a
