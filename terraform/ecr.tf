#create ecr
module "ecr" {
   source = "git::https://github.com/CBIIT/datacommons-devops.git//terraform/modules/ecr?ref=v1.0"
   stack_name = var.project
   ecr_repo_names = var.ecr_repo_names
   tags = var.tags
   create_env_specific_repo = false
   env = terraform.workspace
}