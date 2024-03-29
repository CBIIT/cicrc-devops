output "db_password" {
  value     = try(module.rds.db_instance_password, "")
  sensitive = true
}

output "random_password" {
  value = try(module.rds.db_random_password, "")
}