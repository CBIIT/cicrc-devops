output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = try(aws_db_instance.rds_mysql.endpoint, "")
}

output "db_instance_password" {
  description = "The master password"
  value       = try(aws_db_instance.rds_mysql.password, "")
  sensitive   = true
}

output "db_random_password" {
  description = "The master password"
  value       = nonsensitive(try(random_password.password.result, ""))
}