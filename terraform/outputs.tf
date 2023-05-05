output "db_password" {
  value     = try(module.rds.db_instance_password, "")
  sensitive = true
}

output "random_password" {
  value = try(module.rds.db_random_password, "")
}

output "ecs_log_groups" {
  value     = try(module.ecs.ecs_log_groups, "")
}