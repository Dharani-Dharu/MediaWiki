## Note on Backend S3 configuration ##
* This code has backend configured as S3  in main.tf file. 

* If you wish to create S3 for backend, please use the simple code under pre set up for launching a basic S3 to store your state. 

* If you do not wish to use it, you can create your own S3 with your already existing S3 module for the backend

* If you no longer want to use any backend, you can simply remove the configuration from the file. Terraform will detect this like any other change and prompt you to reinitialize.

* As part of the reinitialization, Terraform will ask if you'd like to migrate your state back down to normal local state. Once this is complete then Terraform is back to behaving as it does by default.

* Use : terraform init -backend-config backend.tfvars to avoid the manual prompting

## Usage
```hcl

```

## Note on .tflint.hcl file
Reference :  https://github.com/terraform-linters/tflint/blob/master/README.md

* TFLint inspects all configurations under the current directory by default. 
* Command-direct-config : tflint --deep
* Command-module : tflint --deep --module

## Terraform commands used to test

terraform validate
terraform init
terraform plan -var-file terraform.tfvars
terraform apply -var-file terraform.tfvars


<!-- BEGINNING OF OUTPUT FROM terraform-docs plugin -->
<!-- Command used terraform-docs md table . > README.md -->
<!-- Reference : https://github.com/terraform-docs/terraform-docs -->


<!-- END OF OUTPUT FROM terra-docs -->

## Authors
Dharani Sowndharya 