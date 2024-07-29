resource "aws_db_instance" "rds_mysql" {
  identifier             = local.identifier
  allocated_storage      = var.allocated_storage
  max_allocated_storage  = var.max_allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = local.dba_username
  password               = random_password.password.result
  parameter_group_name   = var.parameter_group_name
  db_subnet_group_name   = aws_db_subnet_group.db_subnets.id
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds.id]

  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  copy_tags_to_snapshot   = true
  storage_encrypted       = true

  tags = merge(
    {
      "Runtime" = local.rds_schedule
    },
    var.tags,
  )
}

resource "aws_db_subnet_group" "db_subnets" {
  name       = local.db_subnet_group
  subnet_ids = var.db_subnet_ids

  tags = var.tags
}

resource "random_password" "password" {
  length           = 10
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  keepers = {
    Name = local.dba_username
  }
}