terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_efs_file_system" "file_system" {
  creation_token                  = var.creation_token
  encrypted                       = var.encrypted
  kms_key_id                      = var.encrypted && var.kms_key_id != null ? var.kms_key_id : null
  performance_mode                = var.performance_mode
  throughput_mode                 = var.throughput_mode
  provisioned_throughput_in_mibps = var.throughput_mode == "provisioned" ? var.provisioned_throughput_in_mibps : null
  tags                            = var.tags
  lifecycle_policy {
    transition_to_ia = var.lifecycle_policy
  }
}

resource "aws_efs_mount_target" "alpha" {
  file_system_id = aws_efs_file_system.file_system.id
  subnet_id      = var.subnet_id
}
