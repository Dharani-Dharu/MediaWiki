<!-- BEGINNING OF OUTPUT FROM terraform-docs plugin -->
<!-- Command used terraform-docs md table . > README.md -->
<!-- Reference : https://github.com/terraform-docs/terraform-docs -->

## Requirements   

No requirements.  

## Providers      

| Name | Version |
|------|---------|
| aws | n/a |     

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| db\_ami | Enter the ami id of a DB machine | `string` | n/a | yes |
| db\_ec2\_tags | Tags for ASG instances | `map(string)` | <pre>{<br>  "Name": "db-ec2",<br>  "type": "db"<br>}</pre> | no |
| db\_instance\_type | Type of instance | `string` | `"t2.micro"` | no |
| db\_subnet\_id | List of private subnet IDS | `string` | `""` | no |
| ec2\_sg\_id | SG ID of EC2 | `list(string)` | n/a | yes |
| key\_pair\_name | Name of instance key pair | `string` | `"usw2_keypair"` | no |

## Outputs

| Name | Description |
|------|-------------|
| dbserver\_instance\_id | Instance ID of DB server |


<!-- END OF OUTPUT FROM terra-docs -->