1. Go to ansible-playbooks folder
    * Run the plays for the webserver set up by passing the "web" tag to ansible-playbook command
        * vault password : mediawiki
        * Web server set up :
            * ansible-playbook -i aws_ec2.yml mediawiki.yml --tags "web" --ask-vault-pass
        * DB server set up:
            *  ansible-playbook -i db_aws_ec2.yml mediawiki.yml --tags "db" --ask-vault-pass
        * SE Linux changes:
            * ansible-playbook -i db_aws_ec2.yml mediawiki.yml --tags "selinux" --ask-vault-pass

2. Ansible-playbooks
    * Roles for launnching the mediawiki website
    * Tasks tagged "web" will install necessary components for application
    * Tasks tagged "db" will install necessary components for DB server
    * Tasks tagged "selinux" can be changed for changing any SE linux settings in the machine
    * mediawiki.yml is the calling main yaml for the role
        * Has serial:1 added in the top to simulate the rolling update
        * More changes like removing and attaching back to LB can be done with further changes in code
        * Uses the new aws_ec2 plugin for getting a dynamic inventory file based on tags which can be passed to ansible-playbook      

3. Install boto3 and botocore after setting up Ansible. This is needed for running the aws_ec2 plugin for dynamic inventory

4. The instances should be tagged type:app and type:db for the dynamic inventory to pick those instances for applying ansible playbook. 


## Action items ##

1. roles/mediawiki/tasks/main.yml 
    1. Task 1 : Seaparate Web and DB installation items