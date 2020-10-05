## Requirements

The modules were tested and run against Terraform version : Terraform v0.13.4

## Providers

* AWS  - provider registry.terraform.io/hashicorp/aws v3.8.0

## Inputs

Please pass the inputs from the folders present in resources

## Folder structure

* Resources - Calling folders for respective modules
    * computing
        * ASG
        * EC2
        * ALB

    * networking
        * VPC
        * Route table
        * Subnets
        * IGW
        * NAT
        * Associations

    * pre_setup
        * S3 bucket for storing backend state

    * post_setup




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
Reference : https://github.com/terraform-docs/terraform-docs
terraform-docs md table <path_to_file> > README.md

## Note on .tflint.hcl file in all modules and resources
Reference :  https://github.com/terraform-linters/tflint/blob/master/README.md

* TFLint inspects all configurations under the current directory by default. 
* Command-direct-config :tflint --deep
* Command-module : tflint --deep --module

## Note on Backend S3 configuration ##
* This code has backend configured as S3  in main.tf file. 

* If you wish to create S3 for backend, please use the simple code under pre set up for launching a basic S3 to store your state. 

* If you do not wish to use it, you can create your own S3 with your already existing S3 module for the backend

* If you no longer want to use any backend, you can simply remove the configuration from the file. Terraform will detect this like any other change and prompt you to reinitialize.

* As part of the reinitialization, Terraform will ask if you'd like to migrate your state back down to normal local state. Once this is complete then Terraform is back to behaving as it does by default.

* Use : terraform init -backend-config backend.tfvars to avoid the manual prompting
