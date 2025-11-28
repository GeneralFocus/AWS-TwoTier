variable "env_name" {
  type = string 
}
variable "min_size" {
  type = number 
}
variable "max_size" {
  type = number 
}
variable "desired_capacity" {
  type = number 
}
variable "lt_id" {
  type = string 
}
variable "tg_arn" {
  type = string 
}
variable "private_subnets" {
  type = list(string) 
}