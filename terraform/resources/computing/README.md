## Note on Backend S3 configuration ##
* This code has backend configured as S3  in main.tf file. 

* If you wish to create S3 for backend, please use the simple code under pre set up for launching a basic S3 to store your state. 

* If you do not wish to use it, you can create your own S3 with your already existing S3 module for the backend

* If you no longer want to use any backend, you can simply remove the configuration from the file. Terraform will detect this like any other change and prompt you to reinitialize.

* As part of the reinitialization, Terraform will ask if you'd like to migrate your state back down to normal local state. Once this is complete then Terraform is back to behaving as it does by default.

* Use : terraform init -backend-config backend.tfvars to avoid the manual prompting

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

## Requirements

| Name | Version |      
|------|---------|      
| terraform | = 0.13.4 |
| aws | ~> 3.8.0 |      

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alb\_name | The resource name and Name tag of the load balancer. | `string` | `null` | no |
| alb\_sg\_id | SG ID of ALB | `list(string)` | n/a | yes |
| ami\_id | Enter the ami id of a  centos machine | `string` | n/a | yes |
| asg\_tags | Tags for ASG instances | `map(string)` | <pre>{<br>  "Name": "asg-ec2",<br>  "type": "app"<br>}</pre> | no |
| db\_ami | Enter the ami id of a DB machine | `string` | n/a | yes |
| db\_ec2\_tags | Tags for ASG instances | `map(string)` | <pre>{<br>  "Name": "db-ec2",<br>  "type": "db"<br>}</pre> | no |
| db\_instance\_type | Type of instance | `string` | `"t2.micro"` | no |
| db\_subnet\_id | List of private subnet IDS | `string` | `""` | no |
| desired\_instance\_count | Min instance count | `number` | `1` | no |
| ec2\_sg\_id | SG ID of EC2 | `list(string)` | n/a | yes |
| health\_check | Health check settings | `list(map(string))` | <pre>[<br>  {<br>    "path": "/",<br>    "port": "traffic-port",<br>   
 "protocol": "HTTP"<br>  }<br>]</pre> | no |
| http\_listener\_port | Listener port for HTTP | `number` | `80` | no |
| http\_listener\_protocol | Listener protocol | `string` | `"HTTP"` | no |
| instance\_type | Type of instance | `string` | `"t2.micro"` | no |
| is\_internal | Boolean determining if the load balancer is internal or externally facing. | `bool` | `false` | no |
| key\_pair\_name | Name of instance key pair | `string` | `"usw2_keypair"` | no |
| lc\_name | Name of launch configuration | `string` | `"lcv-01"` | no |
| load\_balancer\_type | The type of load balancer to create. Possible values are application or network. | `string` | `"application"` 
| no |
| max\_instance\_count | Max instance count | `number` | `1` | no |
| min\_instance\_count | Min instance count | `number` | `1` | no |
| private\_subnet\_ids | List of private subnet IDS | `list(string)` | `[]` | no |
| region | Region to spin VPC in | `string` | `"us-west-2"` | no |
| subnets\_id\_list | A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f'] | `list(string)` | `null` | no |
| target\_group\_port | Port of TG | `number` | `80` | no |
| target\_group\_protocol | Protocol of TG | `string` | `"HTTP"` | no |
| vpc\_id | Enter the VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| private\_key | n/a |

<!-- END OF OUTPUT FROM terra-docs -->

## Authors
Dharani Sowndharya 