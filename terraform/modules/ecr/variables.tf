variable "tags" {
  description = "tags to associate with this instance"
  type        = map(string)
}

variable "ecr_repo_names" {
  description = "list of repo names"
  type        = list(string)
}

variable "project" {
  description = "name of the project"
  type        = string
}

variable "replication_destination_registry_id" {
  type        = string
  description = "registry id for destination image"
  default     = ""
}
variable "replication_source_registry_id" {
  type        = string
  description = "registry id for source image"
  default     = ""
}
variable "enable_ecr_replication" {
  description = "enable ecr replication"
  type        = bool
  default     = false
}
variable "allow_ecr_replication" {
  description = "allow ecr replication"
  type        = bool
  default     = false
}