terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Get the default subnet
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Create multiple EC2 instances
resource "aws_instance" "sandip" {
  count = 3

  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"

  subnet_id = data.aws_subnets.default.ids[0]

  tags = {
    Name        = "Terraform-EC2-${count.index + 1}"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}
