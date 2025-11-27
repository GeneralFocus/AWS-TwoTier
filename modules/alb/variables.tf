variable "env_name" {
  type = string # Added 'type' attribute
}
variable "public_subnets" {
  type = list(string)
}
variable "alb_sg" {
  type = string
}
variable "vpc_id" {
  type = string
}