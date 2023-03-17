resource "aws_security_group" "rds" {
  name        = "${var.project}-${var.env}-rds-mysql-sg"
  vpc_id      = var.vpc_id
  description = "Allow traffic to/from RDS MySQL"
  tags        = var.tags
}

resource "aws_security_group_rule" "rds_inbound" {
  description       = "From allowed SGs"
  type              = "ingress"
  from_port         = local.db_port
  to_port           = local.db_port
  protocol          = local.protocol
  cidr_blocks       = local.nih_cidr_ranges
  security_group_id = aws_security_group.rds.id
}

resource "aws_security_group_rule" "egress" {
  description       = "allow all outgoing traffic"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = local.any
  cidr_blocks       = local.all_ips
  security_group_id = aws_security_group.rds.id
}