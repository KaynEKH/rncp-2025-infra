variable "db_identifier" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "db_engine_version" {
  default = "15"
}
variable "db_instance_class" {
  default = "db.t3.micro"
}
variable "db_allocated_storage" {
  default = 20
}
variable "multi_az" {
}
variable "vpc_id" {}
variable "private_subnet_ids" {
  type = list(string)
}
variable "tags" {
  type = map(string)
}
variable "port" {
  default = 5432
}