terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "users" {
  type = list(string)

  default = [
    "rahul_sharma",
    "amit_verma",
    "rohit_singh",
    "arjun_patel",
    "vikas_kumar",
    "suresh_yadav",
    "manish_gupta",
    "ankit_mehta",
    "deepak_joshi",
    "pankaj_mishra",
    "ravi_nair",
    "karthik_reddy",
    "sanjay_rao",
    "praveen_kumar",
    "vivek_chauhan",
    "akash_saxena",
    "naveen_sharma",
    "mohit_agarwal",
    "abhishek_jain",
    "varun_malhotra",
    "aditya_pandey",
    "sumit_bansal",
    "gaurav_tiwari",
    "nikhil_kapoor",
    "rohit_das",
    "sachin_desai",
    "ajay_iyer",
    "harish_menon",
    "yash_thakur",
    "tarun_bhatia"
  ]
}

resource "aws_iam_user" "users" {
  for_each = toset(var.users)

  name = each.value

  tags = {
    ManagedBy = "Terraform"
    Environment = "Development"
  }
}

output "created_users" {
  value = [for user in aws_iam_user.users : user.name]
}
