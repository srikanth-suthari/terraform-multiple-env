terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
      bucket = "my-remote-state-bucket-terraform"
      key    = "remote-state-demo"
      region = "us-east-1"
      use_lockfile = true
      encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1" #this is an optional line (if we want a specific region we need to enable this)
}