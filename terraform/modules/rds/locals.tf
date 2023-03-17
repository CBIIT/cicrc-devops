locals {

  dba_username    = "${var.project}dba"
  identifier      = "${var.project}-${var.env}-mysql"
  nih_cidr_ranges = ["129.43.0.0/16", "137.187.0.0/16", "10.128.0.0/9", "165.112.0.0/16", "156.40.0.0/16", "10.208.0.0/21", "128.231.0.0/16", "130.14.0.0/16", "157.98.0.0/16", "10.133.0.0/16"]
  db_port         = 3306
  protocol        = "tcp"
  all_ips         = ["0.0.0.0/0"]
  any             = "-1"

}