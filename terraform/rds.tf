# modules
module "rds" {
  source         = "./modules/rds"
  project = var.project
  env = terraform.workspace
  db_security_groups = var.db_security_groups
  db_subnet_ids = var.db_subnet_ids
  tags = var.tags
}