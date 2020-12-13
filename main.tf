terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_efs_file_system" "foo_with_lifecyle_policy" {
  creation_token = var.creation_token

  lifecycle_policy {
    transition_to_ia = var.lifecycle_policy
  }
}

resource "aws_efs_mount_target" "alpha" {
  file_system_id = aws_efs_file_system.foo_with_lifecyle_policy.id
  subnet_id      = var.subnet_id
}
