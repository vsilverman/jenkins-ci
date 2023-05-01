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
and verify that the web server is running. After that you can run `test-deploy.sh`.
It will redeploy the web server by changing the incoming port number and test
a new deployment.
