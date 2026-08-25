terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_ec2_host" "example" {
  instance_family   = "t3"
  availability_zone = "us-east-1a"
  host_recovery     = "off"
  auto_placement    = "on"
}

resource "aws_resourcegroups_group" "nikhil" {
  name = "nikhil"
}

resource "aws_resourcegroups_resource" "nikhil" {
  group_arn    = aws_resourcegroups_group.nikhil.arn
  resource_arn = aws_ec2_host.nikhil.arn
}
  }
}
