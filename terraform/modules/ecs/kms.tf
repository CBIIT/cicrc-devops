resource "aws_kms_key" "ecs_exec" {
  description         = local.kms_description
  enable_key_rotation = true

  tags = merge(
    {
      "Name" = format("%s-%s", var.project, "ecs-exec-kms-key")
    },
    var.tags
  )
}
