variable "env_name" {}
variable "public_subnets" {
  type = list(string)
}
variable "alb_sg" {}
variable "vpc_id" {}
