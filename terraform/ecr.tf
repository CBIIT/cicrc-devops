variable "ecr_repo_names" {
  description = "list of repo names"
  type        = list(string)
}

variable "create_ecr_repos" {
  type        = bool
  default     = false
  description = "choose whether to create ecr repos or not"
}

#create ecr
module "ecr" {
  count                    = var.create_ecr_repos ? 1 : 0
  source                   = "./modules/ecr"
  project                  = var.project
  ecr_repo_names           = var.ecr_repo_names
  tags                     = var.tags
}