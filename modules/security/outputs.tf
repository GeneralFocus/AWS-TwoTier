output "alb_sg" {
  value = aws_security_group.alb_sg.id
}

output "web_sg" {
  value = aws_security_group.web_sg.id
}
