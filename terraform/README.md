# Deployment through Terraform

## Quick start

**Note**: These folder shows how to deploy resources into your AWS account. 
You may consider using [AWS Free Tier](https://aws.amazon.com/free/), it is not our responsibility if you are charged money for this.

1. Install [Terraform](https://www.terraform.io/).
1. Create AWS credentials file and insert there your `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.
1. `cd` into this folder.
1. Run `terraform init`.
1. Run `terraform apply`.
1. After it's done deploying, it will output file with URLs and IPs you can try out.
1. To clean up and delete all resources after you're done, run `terraform destroy`.