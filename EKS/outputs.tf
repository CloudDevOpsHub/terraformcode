output "cluster_name" { value = module.eks.cluster_name }
output "cluster_endpoint" { value = module.eks.cluster_endpoint }
output "cluster_arn" { value = module.eks.cluster_arn }
output "vpc_id" { value = module.vpc.vpc_id }
