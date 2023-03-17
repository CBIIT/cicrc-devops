#output "db_instance_address" {
#  description = "The address of the RDS instance"
#  value       = try(aws_db_instance.rds_instance[0].address, "")
#}
#
#output "db_instance_arn" {
#  description = "The ARN of the RDS instance"
#  value       = try(aws_db_instance.rds_instance[0].arn, "")
#}
#
#output "db_instance_endpoint" {
#  description = "The connection endpoint"
#  value       = try(aws_db_instance.rds_instance[0].endpoint, "")
#}

################################################################################
# CloudWatch Log Group
################################################################################
#
#output "db_instance_cloudwatch_log_groups" {
#  description = "Map of CloudWatch log groups created and their attributes"
#  value       = aws_cloudwatch_log_group.cw_log
#}