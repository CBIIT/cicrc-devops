resource "aws_security_group" "alb" {
  name        = "${local.alb_name}-sg"
  description = local.alb_sg_description
  vpc_id      = var.vpc_id
  tags = merge(
    {
      "Name" = format("%s-sg", local.alb_name)
    },
    var.tags,
  )
}

resource "aws_security_group_rule" "all_egress" {
  security_group_id = aws_security_group.alb.id
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "egress"
}