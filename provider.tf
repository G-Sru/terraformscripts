terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
    provider "aws" {
  region     = "us-east-2"
  }
terraform {
  backend "s3" {
    bucket = "jenkins-44"
    key = "terraform/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform"
  }
}


