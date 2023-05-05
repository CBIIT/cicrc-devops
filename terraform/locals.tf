locals {
  # Global
  permissions_boundary = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/PermissionBoundary_PowerUser"

  # ALB
  alb_subnet_ids      = terraform.workspace == "prod" || terraform.workspace == "stage" ? var.public_subnet_ids : var.private_subnet_ids
  alb_log_bucket_name = terraform.workspace == "prod" || terraform.workspace == "stage" ? "prod-alb-access-logs" : "nonprod-alb-access-logs"
  cert_types          = "IMPORTED"

  # ECS
  application_url = terraform.workspace == "prod" ? "${var.application_subdomain}.${var.domain_name}" : "${var.application_subdomain}-${terraform.workspace}.${var.domain_name}"
  #application_url = ""

  # SG
  http_port    = 80
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  https_port   = "443"
  #nih_ip_cidrs =  terraform.workspace == "prod" || terraform.workspace == "stage" ? ["0.0.0.0/0"] : [ "129.43.0.0/16" , "137.187.0.0/16"  , "165.112.0.0/16" , "156.40.0.0/16"  , "128.231.0.0/16" , "130.14.0.0/16" , "157.98.0.0/16"]
  nih_ip_cidrs = ["0.0.0.0/0"]
  all_ips      =  ["0.0.0.0/0"]
  allowed_alb_ip_range = terraform.workspace == "prod" || terraform.workspace == "stage" ?  local.all_ips : local.nih_ip_cidrs
  #allowed_alb_ip_range         = local.nih_ip_cidrs
  fargate_security_group_ports = ["80", "443", "3306"]
  efs_security_group_ports = ["2049"]

  ##### UNUSED #####
  #alb_log_bucket_name = var.cloud_platform == "leidos" ? "alb-access-logs" : "${var.cloud_platform}-alb-access-logs"
  #acm_certificate_issued_type = var.cloud_platform == "leidos" ? "AMAZON_ISSUED" : "IMPORTED"
  #ecs_task_role_name = "${var.project}-${terraform.workspace}-ecs-task-role"
  #ecs_task_execution_role_name = "${var.project}-${terraform.workspace}-ecs-task-execution-role"
  #managed_policy_arns = [
  #  "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
  #  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
  #  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  #]
}
