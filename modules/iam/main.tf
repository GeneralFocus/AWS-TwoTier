terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_iam_instance_profile" "profile" {
  name = "LabRole"
  role = var.existing_role_name
}

