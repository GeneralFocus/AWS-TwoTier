terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

resource "aws_autoscaling_group" "asg" {
  name = "${var.env_name}-ASG"

  max_size         = var.max_size
  min_size         = var.min_size
  desired_capacity = var.desired_capacity

  launch_template {
    id      = var.lt_id
    version = "$Latest"
  }

  vpc_zone_identifier = var.private_subnets
  target_group_arns   = [var.tg_arn]
}