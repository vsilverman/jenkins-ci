#!/usr/bin/env bash

GH_USERNAME=$1
IMAGE_ID=$2
IMAGE_NAME=$3
VERSION=$4

echo 'The following docker command deploys your docker built image'
echo 'into the target github repository as a github package'
# Step 1: Authenticate
set -x
cat ~/GH_TOKEN.txt | docker login docker.pkg.github.com -u ${GH_USERNAME} --password-stdin
set +x
# Step 2: Tag
set -x
docker tag ${IMAGE_ID} docker.pkg.github.com/vsilverman/jenkins-ci/${IMAGE_NAME}:${VERSION}
set +x
# Step 3: Publish
set -x
docker push docker.pkg.github.com/vsilverman/jenkins-ci/${IMAGE_NAME}:${VERSION}
set +x
