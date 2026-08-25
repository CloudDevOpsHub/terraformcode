# Terraform EKS Demo

This project creates an Amazon EKS cluster using Terraform.

## Resources

- VPC
- Public subnets
- Private subnets
- NAT Gateway
- EKS cluster
- EKS managed node group
- EKS add-ons

## Commands

terraform fmt
terraform init
terraform validate
terraform plan
terraform apply

## Configure kubectl

aws eks update-kubeconfig --region us-east-1 --name terraform-eks-demo

kubectl get nodes
kubectl get pods -A

## Destroy the lab

terraform destroy

IMPORTANT:
EKS, NAT Gateway, EC2 worker nodes, and other AWS resources can incur charges.
Destroy the environment when you finish the lab.
