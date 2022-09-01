# Deployment through Terraform

## Quick start

**Note**: These folder shows how to deploy resources into your AWS account. 
You may consider using [AWS Free Tier](https://aws.amazon.com/free/), 
and still occasionally check your billing console to avoid being
accidentally charged for using those services.

1. Install [Terraform](https://www.terraform.io/).
2. Create AWS credentials file and insert there your `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.
3. `cd` into this folder.
4. Update main.tf and variables.tf with valid paths to your credential files
5. Run `terraform init`.
6. Run `terraform apply`.
7. After it's done deploying, it will output file with URLs and IPs you can try out.
8. To clean up and delete all resources after you're done, run `terraform destroy`.

## Customized examples

Examples folder contains the sources, allowing to build deployment
infrastructure, configured for specific customer needs. Such customization 
is achieved by separating deployment infrastructure into small building 
blocks, describing infrastructure components, like SSH service, Internet 
gateway, etc. You may see how to build and run these services by
following current project instructions for one of 
[example infrastructure](https://github.com/vsilverman/jenkins-ci/tree/master/terraform/examples/two-tier) 