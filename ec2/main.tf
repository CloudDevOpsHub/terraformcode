terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0904037a6ff76c269" # Fresh Ubuntu 22.04 LTS for us-east-2
  instance_type = "t3.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
