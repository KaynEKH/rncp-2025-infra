module "networking" {
  source         = "./modules/networking"
  aws_region     = var.aws_region
  vpc_cidr_block = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.0.0/24", "10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24", "10.0.3.0/24"]
  availability_zones = ["eu-west-3a", "eu-west-3b"]

  tags = {
    Project = "aws-eks"
  }
}


module "iam" {
  source       = "./modules/iam"
  cluster_name = var.eks_cluster_name
}

module "eks" {
  source                  = "./modules/eks"
  cluster_name            = var.eks_cluster_name
  cluster_version         = var.eks_version
  node_group_name         = var.eks_node_group_name
  instance_type           = var.eks_instance_type
  key_pair_name           = var.eks_key_pair
  vpc_id                  = module.networking.vpc_id
  public_subnet_ids       = module.networking.public_subnet_ids
  private_subnet_ids      = module.networking.private_subnet_ids
  security_group_id       = module.networking.security_group_id
  cluster_role_arn        = module.iam.cluster_role_arn
  node_group_role_arn     = module.iam.node_group_role_arn
  gitlab_ci_user_arn      = module.iam.gitlab_ci_user_arn

  tags = {
    Project = "aws-eks"
  }

}

module "rds" {
  source               = "./modules/rds"
  db_identifier        = "postgres-db"
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  db_engine_version    = "15"
  db_instance_class    = var.db_instance_class
  db_allocated_storage = 20
  multi_az             = true
  vpc_id               = module.networking.vpc_id
  private_subnet_ids   = module.networking.private_subnet_ids

  tags = {
    Project = "aws-eks"
  }
}