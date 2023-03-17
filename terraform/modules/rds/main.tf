resource "aws_db_instance" "rds_mysql" {
  identifier        = "cicrc-dev-mysql"
  #db_name              = "cicrc-dev-mysql"
  allocated_storage    = 10
  max_allocated_storage = 100
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "cicrcdba"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql8.0"
  db_subnet_group_name = "dev-vpc-sngrp"
  skip_final_snapshot  = true
  vpc_security_group_ids = var.db_security_groups
  
  backup_retention_period = 7
  backup_window = "02:00-03:00"
  copy_tags_to_snapshot = true
  
  tags = var.tags
}