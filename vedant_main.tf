terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-south-1"
}

resource "aws_cloudwatch_log_group" "practice" {
  name = "terraform-practice-log-group-vedant"
}
