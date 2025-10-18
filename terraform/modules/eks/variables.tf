variable "cluster_name" {}
variable "cluster_version" {}
variable "node_group_name" {}
variable "instance_type" {}
variable "key_pair_name" {}
variable "vpc_id" {}
variable "public_subnet_ids" {}
variable "private_subnet_ids" {}
variable "security_group_id" {}
variable "cluster_role_arn" {}
variable "node_group_role_arn" {}
variable "gitlab_ci_user_arn" {}
variable "tags" {
  type = map(string)
}
variable "ebs_csi_driver_role_arn" {
    type        = string
}