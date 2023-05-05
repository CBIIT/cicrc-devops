resource "aws_cloudwatch_log_group" "ecs_execute_command_log_group" {
  name              = local.ecs_exec_log_group
  retention_in_days = 90
}

resource "aws_cloudwatch_log_group" "ecs_log_group" {
  for_each = var.microservices
  name     = "${var.project}/ecs/${var.env}/${each.value.name}"
  retention_in_days = 180

  tags = {
    Environment = "${var.env}"
    Project     = "CICRC"
  }
}