resource "aws_efs_file_system" "efs" {
   creation_token = "efs"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
   tags = {
     Project = "CICRC"
   }
 }

resource "aws_efs_mount_target" "efs-mt" {
   for_each = var.efs_subnet_ids
   file_system_id  = aws_efs_file_system.efs.id
   subnet_id = each.value
   security_groups = [aws_security_group.efs.id]
 }