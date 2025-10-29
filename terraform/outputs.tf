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

output "db_name" {
  value = module.rds.db_name
}

output "db_username" {
  value = module.rds.db_username
}

output "db_port" {
  value = module.rds.db_port
}

output "db_password" {
  value     = module.rds.db_password
  sensitive = true
}