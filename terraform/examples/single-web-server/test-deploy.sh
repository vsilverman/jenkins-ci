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
# ------------------------------------------------------------------------------

# wait for httpd server (defined in main.tf) to start
webserver_status=$(terraform state show aws_instance.example | grep http_endpoint)
echo $webserver_status
echo "Waiting for web server to start ..."
while  [[ $webserver_status != *"enabled"* ]]
do
  webserver_status=$(terraform state show aws_instance.example | grep http_endpoint)
  sleep 10
done

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

sleep 10
terraform destroy