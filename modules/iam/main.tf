# Added a 'terraform' configuration block to define version requirements
terraform {
  required_version = ">= 1.0" # Specify the required Terraform version

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Specify a required version for the AWS provider (e.g., v5.x)
    }
  }
}

resource "aws_iam_instance_profile" "profile" {
  name = "LabRole"
  role = var.existing_role_name
}

