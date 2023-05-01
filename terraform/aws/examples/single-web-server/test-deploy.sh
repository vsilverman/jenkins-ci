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
terraform apply -var "server_port=$new_server_port"

# construct new url, based on assigned IP address and a new server port
ip=$(terraform output public_ip)
url="http://$ip:$new_server_port"

# wait for the actions from the end user
read -p "Point your browser to $url, wait for your server to respond, then press any key to continue testing ..."

# continue with automated test and save output results
out_res=$(curl $url)

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