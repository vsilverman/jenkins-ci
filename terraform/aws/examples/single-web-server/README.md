# Deploying a single web server

This repo provides a template for deploying a single web server on Amazon
Web services.

Current template besides deploying a single web server will create on a server
for testing purpose a simple index.html file. However, for creating an advanced
web application and putting it on a web server, it's possible to use either
[provisioners](https://www.terraform.io/docs/provisioners/) and a configuration
management tool, or by pre-baking configured AMIs with
[Packer](http://www.packer.io).

In this example the public ip address of deployed web server is managed by AWS
and the port number, on which this server will be listening to the http traffic,
is managed by the devops engineer, running this example.

After you run `terraform plan` and `terraform apply` on this configuration, it will
output the public url of deployed web server. Point your browser to this url
and verify that the web server is running. After that you can run `test-deploy.sh`
and see how terraform will deploy changes in configuration.

Aletrnatevely you don't even need to manually run terraform commands, since all of
required terraform commands are already included inside `test-deploy.sh` script.
This script will deploy the web server by passing the incoming port number as a
parameter to terraform-based configuration. After finshing the deployment this script
also shows how to provide both manual and automated testing of a new web server.

It would be useful to note that Latest editions of above script provide fixing of the
[Testing deployment with curl tool](https://github.com/vsilverman/jenkins-ci/issues/12)
issue.
