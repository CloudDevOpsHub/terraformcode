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
  region  = "us-west-2"
}

resource "aws_iam_user" "lb" {
  name = "Adam"
}

resource "aws_iam_group" "admins" {
  name = "CloudDevOpsAdministrators"
}

resource "aws_iam_user_group_membership" "adam_admin_membership" {
  user = aws_iam_user.lb.name

  groups = [
    aws_iam_group.admins.name,
  ]
}
