provider "aws" {
  region = "us-west-2"
}
 
resource "aws_instance" "checking" {
  ami = "ami-cfebb0ff"
  instance_type = "t2.micro"
  tags = {
        Description = "Checking if terraform connectivity works to AWS account"
        Name = "Terraform-example"
  }
}