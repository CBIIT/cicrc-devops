module "efs" {
  source          = "./modules/efs"
  project         = var.project
  tags            = var.tags
  vpc_id          = var.vpc_id
  efs_subnet_ids  = var.private_subnet_ids
  env             = terraform.workspace
}