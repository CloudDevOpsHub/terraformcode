
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

resource "aws_instance" "app_server" {
  count         = 3
  ami           = "ami-064ff912f78e3e561"
  instance_type = "t3.micro"

  tags = {
    Name = "app-server-${count.index + 1}"
  }
}

