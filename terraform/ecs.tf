module "ecs" {
  source          = "./modules/ecs"
  project         = var.project
  tags            = var.tags
  vpc_id          = var.vpc_id
  ecs_subnet_ids  = var.private_subnet_ids
  application_url = local.application_url
  env             = terraform.workspace
  microservices   = var.microservices
  #alb_https_listener_arn = module.alb.alb_https_listener_arn
  alb_https_listener_arn  = module.alb.alb_http_listener_arn
  allow_cloudwatch_stream = true
}