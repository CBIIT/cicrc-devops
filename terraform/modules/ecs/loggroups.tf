#create log groups
resource "aws_cloudwatch_log_group" "ecs_log_group" {
  for_each = var.microservices
  name     = each.value.name

  tags = {
    Environment = "${var.env}"
    Project     = "CICRC"
  }
}


output "output_name" {
  value = try(aws_cloudwatch_log_group.ecs_log_group, "")
}