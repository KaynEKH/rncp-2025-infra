eks_cluster_name     = "datascientest"
eks_version          = "1.33"
eks_node_group_name  = "datascientest-node-group"
eks_instance_type    = "t4g.large"
aws_region = "eu-west-3"

eks_key_pair   = "SCO_Traefik2025"

db_name                = "datascientest_db"
db_username            = "datascientest"
db_password = "Datascientest2024"
db_instance_class = "db.t3.micro"