output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
}

output "eks_node_group_name" {
  value = module.eks.eks_node_group_name
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "gitlab_ci_access_key_id" {
  value     = module.iam.gitlab_ci_access_key_id
  sensitive = true
}

output "gitlab_ci_secret_access_key" {
  value     = module.iam.gitlab_ci_secret_access_key
  sensitive = true
}