resource "aws_iam_instance_profile" "profile" {
  name = "LabRole"
  role = var.existing_role_name
}

