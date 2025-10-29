output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "rds_security_group_id" {
  value = aws_security_group.rds.id
}

output "db_name" {
  value = var.db_name
  description = "Nom de la base de données PostgreSQL"
}

output "db_username" {
  value = var.db_username
  description = "Nom d'utilisateur PostgreSQL"
}

output "db_port" {
  value = var.port
  description = "Port PostgreSQL"
}

output "db_password" {
  value     = var.db_password
  sensitive = true
  description = "Mot de passe PostgreSQL (sensible)"
}