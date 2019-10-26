#!/bin/bash

# ------------------------------------------------------------------------------
# This script tests the output from web server
# deployed by terraform to AWS EC2 instance.
# ------------------------------------------------------------------------------

terraform init
terraform plan
terraform apply --auto-approve

# wait for httpd server (defined in main.tf) to start
echo "Waiting for web server to start ..."
sleep 10

ip=$(terraform output public_ip)
server_port=8080

out_res=$(curl "http://$ip:$server_port")

# find if expected text is part of web output
if [[ ${out_res} == *"by Terraform"* ]]; then
  echo "Server output contains expected text"
  echo "Success: Test passed"
else
  echo "Error: Test failed"
fi