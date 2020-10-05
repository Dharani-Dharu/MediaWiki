# Steps 
* Edit the policy.json file to add your respective **account number** and **IAM user** details or replace the existing policy.json with further restrictions before doing a terraform apply


## Note on S3 bucket creation in presetup
* Simple S3 bucket set up for using as a remote state in backend

* Do not use this for a production or equally important S3 set up. Suggested to create a separate module for real world use cases

* Does not support any advanced features like Lifecycle configuration, advanced KMS encryption, logging , CORS, custom poliy using templates

## Note on .tflint.hcl file
Reference :  https://github.com/terraform-linters/tflint/blob/master/README.md

* TFLint inspects all configurations under the current directory by default. 

* Command-direct-config :tflint --deep
* Command-module : tflint --deep --module

## Terraform commands used to test

terraform validate
terraform init
terraform plan -var-file terraform.tfvars
terraform apply -var-file terraform.tfvars

## Usage

```hcl
resource "aws_s3_bucket" "s3" {
  bucket = "test"
  versioning  {
    enabled = false
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags   = {classification = "internal/sensitive"}
}

```


<!-- BEGINNING OF OUTPUT FROM terraform-docs plugin -->
<!-- Command used terraform-docs md table . > README.md -->
<!-- Reference : https://github.com/terraform-docs/terraform-docs -->


## Requirements

| Name | Version |
|------|---------|
| terraform | = 0.13.4 |
| aws | ~> 3.8.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.8.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enable\_versioning | Name of S3 bucket | `bool` | `false` | no |
| region | Region to spin VPC in | `string` | `"us-west-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| s3\_arn | Arn of S3 bucket |
| s3\_id | ID of S3 bucket |

<!-- END OF OUTPUT FROM terra-docs -->

## Authors
Dharani Sowndharya 





