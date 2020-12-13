variable "aws_region" {
  description = ""
  default = "us-east-1"
}

variable "subnet_id" {
description = ""
}

variable "lifecycle_policy" {
  description = ""
  default = "AFTER_30_DAYS"
}
