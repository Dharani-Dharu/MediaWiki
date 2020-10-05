## Note on Networking module

* Creates the following components
    * VPC
    * Public route table
    * Private route table
    * Nat GW
    * IGW
    * Public subnets
    * Private subnets
    * Association of subnets to respective route tables

* Not supported
    * AZ specific NAT/Route table set up
    * No changes to default NACL/Security group

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
* Command-direct-config :tflint --deep
* Command-module : tflint --deep --module

## Terraform commands used to test

terraform validate
terraform init
terraform plan -var-file terraform.tfvars
terraform apply -var-file terraform.tfvars


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
| eip\_tags | Tags to be added for ElasticIP | `map(string)` | <pre>{<br>  "classification": "internal/sensitive"<br>}</pre> | no | 
| enable\_dns\_hostnames | Should be true to enable DNS hostnames in the VPC | `bool` | `true` | no |
| enable\_dns\_support | Should be true to enable DNS support in the VPC | `bool` | `true` | no |
| igw\_tags | Tags to be added for IGW | `map(string)` | <pre>{<br>  "classification": "internal/sensitive"<br>}</pre> | no |       
| private\_subnets\_cidr | A list of private subnets inside the VPC | `list(string)` | `[]` | no |
| public\_subnets\_cidr | A list of public subnets inside the VPC | `list(string)` | `[]` | no |
| route\_table\_tags | Tags to be added for Route table | `map(string)` | <pre>{<br>  "classification": "internal/sensitive"<br>}</pre> | no |
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

<!-- END OF OUTPUT FROM terra-docs -->

## Authors
Dharani Sowndharya 