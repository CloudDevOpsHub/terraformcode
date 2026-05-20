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

# -----------------------------
# EC2 INSTANCE
# -----------------------------
resource "aws_instance" "dev_app_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"

  tags = {
    Name        = "Dev-App-Server"
    Environment = "Development"
    Project     = "CloudInfra"
  }
}

# -----------------------------
# S3 BUCKET
# -----------------------------
resource "aws_s3_bucket" "project_storage_bucket" {
  bucket = "priyank-devops-storage-bucket-9561"

  tags = {
    Name        = "ProjectStorageBucket"
    Environment = "Development"
  }
}

# -----------------------------
# IAM USER
# -----------------------------
resource "aws_iam_user" "devops_engineer_user" {
  name = "priyank.devops.user"
}

# -----------------------------
# VPC
# -----------------------------
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
  }
}

# -----------------------------
# SUBNET AZ1
# -----------------------------
resource "aws_subnet" "private_subnet_az1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "private-subnet-az1"
  }
}

# -----------------------------
# SUBNET AZ2
# -----------------------------
resource "aws_subnet" "private_subnet_az2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "private-subnet-az2"
  }
}

# -----------------------------
# SUBNET AZ3
# -----------------------------
resource "aws_subnet" "private_subnet_az3" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-2c"

  tags = {
    Name = "private-subnet-az3"
  }
}

# -----------------------------
# IAM ROLE FOR EKS
# -----------------------------
resource "aws_iam_role" "devops_eks_role" {
  name = "devops-eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "eks.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

# -----------------------------
# EKS POLICY ATTACHMENT
# -----------------------------
resource "aws_iam_role_policy_attachment" "devops_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.devops_eks_role.name
}

# -----------------------------
# EKS CLUSTER
# -----------------------------
resource "aws_eks_cluster" "devops_eks_cluster" {
  name     = "devops-eks-cluster"
  role_arn = aws_iam_role.devops_eks_role.arn

  version = "1.31"

  vpc_config {
    subnet_ids = [
      aws_subnet.private_subnet_az1.id,
      aws_subnet.private_subnet_az2.id,
      aws_subnet.private_subnet_az3.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.devops_eks_cluster_policy
  ]

  tags = {
    Name        = "DevOps-EKS-Cluster"
    Environment = "Production"
    Project     = "CloudInfra"
  }
}