#create log groups
resource "aws_cloudwatch_log_group" "ecs_log_group" {
  for_each = var.microservices
  name     = "${var.project}/ecs/${var.env}/${each.value.name}"
  retention_in_days = each.value.log_retention

  tags = {
    Environment = "${var.env}"
    Project     = "CICRC"
  }
}