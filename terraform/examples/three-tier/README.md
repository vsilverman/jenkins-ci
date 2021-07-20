# Three-Tier AWS Architecture

This repo provides a template for running a three-tier architecture on Amazon
Web services. 

The targeted three-tier architecture is shown below:
![Targeted three-tier architecture](https://user-images.githubusercontent.com/2159948/126373819-44ecc8ab-ee49-4f72-9908-76d487c33bb9.png)

Current terraform template addresses the following tasks:

1. Configuring the AWS provider
2. Creating VPC
3. Creating web public subnets
4. Creating private subnets for apps and dbs
5. Creating Internet Gateway
6. Creating Web Route Table and Web subnets
7. Creating Web servers and Web Security Groups
8. Creating DB Servers and DB Security Groups
9. Creating App Load Balancer and ALB Target Group
10. Creating RDS Instance
11. Specifying the output

After you run `terraform apply` on this configuration, it will
output the ALB DNS address, allowing to test the web servers and
both ALB instances.
