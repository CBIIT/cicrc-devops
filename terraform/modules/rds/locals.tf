#locals {
#  monitoring_role_arn = var.create_monitoring_role ? aws_iam_role.enhanced_monitoring[0].arn : var.monitoring_role_arn
#
#  final_snapshot_identifier = var.skip_final_snapshot ? null : "${var.final_snapshot_identifier_prefix}-${var.identifier}-${try(random_id.snapshot_identifier[0].hex, "")}"
#
#  identifier        = var.use_identifier_prefix ? null : var.identifier
#  identifier_prefix = var.use_identifier_prefix ? "${var.identifier}-" : null
#
#  monitoring_role_name        = var.monitoring_role_use_name_prefix ? null : var.monitoring_role_name
#  monitoring_role_name_prefix = var.monitoring_role_use_name_prefix ? "${var.monitoring_role_name}-" : null
#
#  # Replicas will use source metadata
#  username       = var.replicate_source_db != null ? null : var.username
#  password       = var.replicate_source_db != null ? null : var.password
#  engine         = var.replicate_source_db != null ? null : var.engine
#  engine_version = var.replicate_source_db != null ? null : var.engine_version
#}

#locals {
#  kms_description                 = "The AWS Key Management Service key that encrypts the data between the local client and the container."
#  ecs_exec_log_group              = "${var.project}-${var.env}-ecs-execute-command-logs"
#  task_execution_role_name        = "${var.iam_prefix}-${var.project}-${var.env}-ecs-task-execution-role"
#  task_role_name                  = "${var.iam_prefix}-${var.project}-${var.env}-ecs-task-role"
#  task_role_policy_exec_name      = "${var.iam_prefix}-${var.project}-${var.env}-ecs-task-role-exec-policy"
#  task_execution_role_policy_name = "${var.iam_prefix}-${var.project}-${var.env}-ecs-task-execution-role-policy"
#  nih_cidr_ranges                 = ["129.43.0.0/16", "137.187.0.0/16", "10.128.0.0/9", "165.112.0.0/16", "156.40.0.0/16", "10.208.0.0/21", "128.231.0.0/16", "130.14.0.0/16", "157.98.0.0/16", "10.133.0.0/16"]
#  vpc_cidr                        = data.aws_vpc.current.cidr_block
#  permission_boundary_arn         = var.env != "stage" || var.env != "prod" ? "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/PermissionBoundary_PowerUser" : null
#}