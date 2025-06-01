terraform {
  required_providers {
    aws = {
        source = "hasicrop/aws"
        version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
    region = "us-east-1"
  
}