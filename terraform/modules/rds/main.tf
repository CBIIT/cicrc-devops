resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "cicrc-dev-mysql"
  engine               = "mysql"
  engine_version       = "8.0.30"
  instance_class       = "db.t3.micro"
  username             = "cicrc"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}

################################################################################
# CloudWatch Log Group
################################################################################
#
#resource "aws_cloudwatch_log_group" "cw_log" {
#  for_each = toset([for log in var.enabled_cloudwatch_logs_exports : log if var.create && var.create_cloudwatch_log_group])
#
#  name              = "/aws/rds/instance/${var.identifier}/${each.value}"
#  retention_in_days = var.cloudwatch_log_group_retention_in_days
#  kms_key_id        = var.cloudwatch_log_group_kms_key_id
#
#  tags = var.tags
#}
#
################################################################################