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