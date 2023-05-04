#!/bin/bash

yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Refresh the screen to verify changing hostname of ALB: $(hostname -f)" > /var/www/html/index.html
