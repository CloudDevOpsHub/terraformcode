terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "my_buckets" {
  count  = 3
  bucket = "anurag-terraform-demo-${count.index + 1}"
}
