## Requirements

The modules were tested and run against Terraform version : Terraform v0.13.4

## Providers

* AWS  - provider registry.terraform.io/hashicorp/aws v3.8.0

## Inputs

Please pass the inputs from the folders present in resources

## Useful Terraform commands
terraform init -backend-config tf-backend.tfvars

terraform plan -var-file tf.tfvars

terraform apply -var-file tf.tfvars

terraform destroy -auto-approve

terraform validate

terraform fmt

terraform workspace new dev
terraform workspace select dev

terraform show

## To create terraform docs
terraform-docs md table <path_to_file> > README.md

