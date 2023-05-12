#!/bin/bash

# ------------------------------------------------------------------------------
# This script tests the output from web server
# deployed by terraform to AWS EC2 instance.
# 
# It assumes that you can sucessfully run the following commands:
#   terraform init
#   terraform fmt
#   terraform validate
#   terraform plan
#   terraform apply --auto-approve
#
# In this example IP address of deployed web server
# is controlled by AWS. The port on which web server
# listens to incoming requests is controlled by the
# end user
#
# ------------------------------------------------------------------------------

# test deployment of the web server, listening on a new port
new_server_port=8090
# terraform plan -var "server_port=$new_server_port"
terraform apply -var "server_port=$new_server_port"

# get the new url, based on created output variable
url=`terraform output url`

echo "*** Waiting 5 min. for the web server to be up and running ..."
sleep 300

echo "*** Initially perform manual testing ..."
# wait for the actions from the end user
read -p "Point your browser to $url, wait for your server to respond, then press any key to continue testing ..."

echo "*** Continue with automated testing ..."
# below is the fix of the issue, described at https://github.com/vsilverman/jenkins-ci/issues/12
url_length=${#url}
let last_index=$url_length-2
good_url=${url:1:$last_index}

# save output results
out_res=`curl $good_url`

# find if expected text is part of web output
if [[ ${out_res} == *"by Terraform"* ]]; then
  echo "Server output contains expected text"
  echo "Success: Test passed"
else
  echo "Error: Test failed"
fi

# destroy resources if approved by the end user
sleep 10
terraform destroy