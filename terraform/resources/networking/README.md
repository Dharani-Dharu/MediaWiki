## Note on Backend S3 configuration ##
* This code has backend configured as S3  in main.tf file. 

* If you wish to create S3 for backend, please use the simple code under pre set up for launching a basic S3 to store your state. 

* If you do not wish to use it, you can create your own S3 with your already existing S3 module for the backend

* If you no longer want to use any backend, you can simply remove the configuration from the file. Terraform will detect this like any other change and prompt you to reinitialize.

* As part of the reinitialization, Terraform will ask if you'd like to migrate your state back down to normal local state. Once this is complete then Terraform is back to behaving as it does by default.

* Use : terraform init -backend-config backend.tfvars to avoid the manual prompting

## Usage
```hcl
module "networking" {
  source               = "../../modules/networking/"
  create_vpc           = true
  cidr                 = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  vpc_tags             = {
    "Name" = "MediaWiki-VPC"
    "Classification" = "internal/sensitive"
}
  public_subnets_cidr  = ["10.0.4.0/27", "10.0.5.0/27"]
  private_subnets_cidr = ["10.0.8.0/27", "10.0.9.0/27"]
  azs                  = ["us-west-2a", "us-west-2b"]
}

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

## Note on the security group ##
Dynamic creation of SG failed through modules. Need time to analyse further. Hence added a direct substitution temporarily.

<!-- BEGINNING OF OUTPUT FROM terraform-docs plugin -->
<!-- Command used terraform-docs md table . > README.md -->
<!-- Reference : https://github.com/terraform-docs/terraform-docs -->
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
| azs | A list of availability zones names or ids in the region | `list(string)` | `[]` | no |
| cidr | The CIDR block for the VPC. | `string` | `"10.0.0.0/16"` | no |
| create\_vpc | Controls if VPC should be created (it affects almost all resources) | `bool` | `true` | no |
| enable\_dns\_hostnames | Should be true to enable DNS hostnames in the VPC | `bool` | `true` | no |
| enable\_dns\_support | Should be true to enable DNS support in the VPC | `bool` | `true` | no |
| private\_subnets\_cidr | A list of private subnets inside the VPC | `list(string)` | `[]` | no |
| public\_subnets\_cidr | A list of public subnets inside the VPC | `list(string)` | `[]` | no |
| vpc\_tags | Tags to be added for VPC | `map(string)` | <pre>{<br>  "classification": "internal/sensitive"<br>}</pre> | no |       

## Outputs

| Name | Description |
|------|-------------|
| igw\_arn | The ARN of the Internet Gateway |
| igw\_id | The ID of the Internet Gateway |
| nat\_ids | List of allocation ID of Elastic IPs created for AWS NAT Gateway |
| natgw\_ids | List of NAT Gateway IDs |
| private\_route\_table\_ids | List of IDs of private route tables |
| private\_subnet\_arns | List of ARNs of private subnets |
| private\_subnets | List of IDs of private subnets |
| private\_subnets\_cidr\_blocks | List of cidr\_blocks of private subnets |
| public\_route\_table\_ids | List of IDs of public route tables |
| public\_subnet\_arns | List of ARNs of public subnets |
| public\_subnets | List of IDs of public subnets |
| public\_subnets\_cidr\_blocks | List of cidr\_blocks of public subnets |
| vpc\_arn | The ARN of the VPC |
| vpc\_cidr\_block | The CIDR block of the VPC |
| vpc\_enable\_dns\_hostnames | Whether or not the VPC has DNS hostname support |
| vpc\_enable\_dns\_support | Whether or not the VPC has DNS support |
| vpc\_id | The ID of the VPC |
| ec2\_sg\_id | The ID of the EC2 SG |
| alb\_sg\_id | The ID of the ALB SG |


<!-- END OF OUTPUT FROM terra-docs -->

## Authors
Dharani Sowndharya 