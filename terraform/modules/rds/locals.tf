locals {

  dba_username = "${var.project}dba"
  rds_master_password = {password = random_password.master_password.result}
  identifier        = "${var.project}-${var.env}-mysql"

}