#!/bin/bash

# -----------------------------------------------------------------
# This script enables continuous analysis of the quality of the app
# Before running this script do the following:
# - create account, organization, project on https://sonarcloud.io
# - bind sonar org. to your public repo, e.g. at https://github.com
# - get sonar.login key

# Enter your project values in the script below

# After running this script allow your team members to login into
# your project at https://sonarcloud.io, view the app quality,
# and continuously modify it to get better results
# -----------------------------------------------------------------


mvn sonar:sonar \
    -Dsonar.host.url=https://sonarcloud.io \
    -Dsonar.projectKey=YOUR_PROJECT \
    -Dsonar.organization=YOUR_ORGANIZATION \
    -Dsonar.login=YOUR SONAR LOGIN KEY
