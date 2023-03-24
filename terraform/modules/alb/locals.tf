locals {
  http_port          = "80"
  https_port         = "443"
  alb_name           = "${var.project}-${var.env}-alb"
  alb_sg_description = "The security group attached to the ${var.project}-alb-${var.env} application load balancer"
}