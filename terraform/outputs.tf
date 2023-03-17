output "db_password" {
  value = try(module.rds.db_instance_password, "")
}