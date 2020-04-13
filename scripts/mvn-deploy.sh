#!/usr/bin/env bash

GH_USERNAME=$1

echo 'The following Maven command deploys your Maven-built Java application'
echo 'into the target github repository'
set -x
GH_TOKEN=`cat ~/GH_TOKEN.txt`
mvn deploy -Dregistry=https://maven.pkg.github.com/${GH_USERNAME} -Dtoken=${GH_TOKEN}
set +x
