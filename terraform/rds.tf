# modules
module "rds" {
  source         = "./modules/rds"
  db_security_groups = var.db_security_groups
}