variable "bucket_name" {
  description = "name of the s3 bucket"
  type        = string
}
variable "s3_force_destroy" {
  description = "force destroy s3 bucket"
  type        = string
}

variable "tags" {
  description = "tags to associate with this resource"
  type        = map(string)
}

variable "project" {
  description = "name of the project"
  type        = string
}

variable "env" {
  description = "name of the environment to provision"
  type        = string
}

variable "s3_versioning_status" {
  description = "Set the status of the bucket versioning feature. Options include Enabled and Disabled"
  type        = string
  default     = "Enabled"
}

variable "s3_intelligent_tiering_status" {
  description = "Set the status of the intelligent tiering configuration. Options include Enabled and Disabled"
  type        = string
  default     = "Enabled"
}

variable "days_for_archive_tiering" {
  description = "Number of days of consecutive lack of access for an object before it is archived"
  type        = number
}

variable "days_for_deep_archive_tiering" {
  description = "Number of days of consecutive lack of access for an object before it is archived deeply"
  type        = number
}

variable "s3_enable_access_logging" {
  description = "set to true to enable s3 access logging"
  type        = bool
  default     = true
}

variable "s3_log_prefix" {
  description = "The prefix for the destination of the server access logs for an S3 bucket"
  type        = string
  default     = "logs/"
}

variable "s3_access_log_bucket_id" {
  description = "The destination bucket of access logs for an S3 bucket"
  type        = string
}

variable "s3_enable_acl" {
  description = "set to true to enable s3 acl"
  type        = bool
  default     = true
}

variable "s3_enable_intelligent_tiering" {
  description = "set to true to enable s3 intelligent tiering"
  type        = bool
  default     = true
}

variable "s3_enable_bucket_expiration" {
  description = "set to true to enable s3 bucket expiration policy"
  type        = bool
  default     = false
}

variable "s3_expiration_days" {
  description = "Number of days of days to keep bucket items"
  type        = number
  default     = 30
}