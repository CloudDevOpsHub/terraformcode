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


variable "servers" {
  default = ["web", "app"]
}

resource "aws_instance" "server" {
  for_each = toset(var.servers)

  ami           = "ami-064ff912f78e3e561"
  instance_type = "t3.micro"

  tags = {
    Name = each.key
  }
}
