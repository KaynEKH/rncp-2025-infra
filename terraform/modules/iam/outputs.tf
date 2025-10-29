output "node_group_role_arn" {
  value = aws_iam_role.eks_node_group.arn
}

output "cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "gitlab_ci_user_arn" {
  value = aws_iam_user.gitlab_ci_user.arn
}

output "gitlab_ci_access_key_id" {
  value       = aws_iam_access_key.gitlab_ci_key.id
}

output "gitlab_ci_secret_access_key" {
  value       = aws_iam_access_key.gitlab_ci_key.secret
  sensitive   = true
}