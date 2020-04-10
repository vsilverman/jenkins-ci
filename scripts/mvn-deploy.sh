#!/usr/bin/env bash

GH_USERNAME=$1
GH_TOKEN=$2

echo 'The following Maven command deploys your Maven-built Java application'
echo 'into the target github repository'
set -x
# mvn deploy -Dregistry=https://maven.pkg.github.com/${GH_USERNAME} -Dtoken=${GH_TOKEN}
set +x
