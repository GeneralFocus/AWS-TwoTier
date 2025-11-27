terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}


resource "aws_launch_template" "lt" {
  name_prefix   = "${var.env_name}-LT"
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.web_sg]
  }

  user_data = base64encode(templatefile("${path.module}/user_data.sh", {
    bucket = var.bucket
  }))

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.env_name}-instance"
      Env  = var.env_name
    }
  }

}