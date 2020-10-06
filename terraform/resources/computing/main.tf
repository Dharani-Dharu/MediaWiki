terraform {
  required_version = "= 0.13.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.8.0"
    }
  }
  backend "s3" {

  }
}
provider "aws" {
    region = var.region
}