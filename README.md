## Requirements

The modules were tested and run against Terraform version : Terraform v0.13.4

## Providers

* AWS  - provider registry.terraform.io/hashicorp/aws v3.8.0

## Inputs

Please pass the inputs from the folders present in resources

## Rolling update 
https://docs.ansible.com/ansible/latest/user_guide/playbooks_strategies.html

## Folder structure

* Resources - Calling folders for respective modules
    * computing
        * ASG with LC
        * EC2 for DB
        * ALB
        * HTTP listener
        * TG for port 80

    * networking
        * VPC
        * Route table
        * Subnets
        * IGW
        * NAT
        * Associations
        * Security group for ELB and EC2

    * pre_setup
        * S3 bucket for storing backend state

* Ansible-playbooks
    * Roles for launnching the mediawiki website
    * Tasks tagged "web" will install necessary components for application
    * Tasks tagged "db" will install necessary components for DB server
    * Tasks tagged "selinux" can be changed for changing any SE linux settings in the machine
    * mediawiki.yml is the calling main yaml for the role
        * Has serial:1 added in the top to simulate the rolling update
        * More changes like removing and attaching back to LB can be done with further changes in code
        * Uses the new aws_ec2 plugin for getting a dynamic inventory file based on tags which can be passed to ansible-playbook        


## Pre-Req
1. Terraform is installed and is available on the path
2. Both access and secret keys are in the $PATH
3. Ansible is installed and is available in the path
4. AWS Access key and secret key are present in the environment variable
5. Ansible working testing in Centos 7 machine
6. Install boto3 and botocore after setting up Ansible. This is needed for running the aws_ec2 plugin for dynamic inventory
7. The instances should be tagged type:app and type:db for the dynamic inventory to pick those instances for applying ansible playbook. 



## Set up instructions
1. Make a git clone
2. Go to terraform and go to resources
    * cd terraform/resources/
3. Run the code in presetup to set up S3 for backend
    * cd presetup
    * terraform apply -var-file terraform.tfvars
4. Run the code in networking folder next for setting up all necessary working components
    * cd terraform/resources/networking
    * terraform init -backend-config backend.tfvars
    * terraform apply -var-file terraform.tfvars
5. Run the code under computing to set up an ASG for app server and an Ec2 machine for DB
    * cd terraform/resources/computing
    * terraform init -backend-config backend.tfvars
    * terraform apply -var-file terraform.tfvars
4. Go to ansible-playbooks folder
    * Run the plays for the webserver set up by passing the "web" tag to ansible-playbook command
        * vault password : mediawiki
        * Web server set up :
            * ansible-playbook -i aws_ec2.yml mediawiki.yml --tags "web" --ask-vault-pass
        * DB server set up:
            *  ansible-playbook -i db_aws_ec2.yml mediawiki.yml --tags "db" --ask-vault-pass
        * SE Linux changes:
            * ansible-playbook -i db_aws_ec2.yml mediawiki.yml --tags "selinux" --ask-vault-pass


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
* Command-direct-config : tflint --deep
* Command-module : tflint --deep --module

## Note on Backend S3 configuration ##
* This code has backend configured as S3  in main.tf file. 

* If you wish to create S3 for backend, please use the simple code under pre set up for launching a basic S3 to store your state. 

* If you do not wish to use it, you can create your own S3 with your already existing S3 module for the backend

* If you no longer want to use any backend, you can simply remove the configuration from the file. Terraform will detect this like any other change and prompt you to reinitialize.

* As part of the reinitialization, Terraform will ask if you'd like to migrate your state back down to normal local state. Once this is complete then Terraform is back to behaving as it does by default.

* Use : terraform init -backend-config backend.tfvars to avoid the manual prompting


## Reference

https://github.com/terraform-aws-modules/terraform-aws-alb/blob/master/main.tf
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb#allocation_id
https://www.linuxtechi.com/install-mediawiki-on-linux/
https://github.com/Amelia-Lopez/Ansible-MediaWiki
https://github.com/vikramkunisetty/mediawiki

