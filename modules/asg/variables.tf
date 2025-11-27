variable "env_name" {
  type = string # Corrected
}
variable "min_size" {
  type = number # Corrected
}
variable "max_size" {
  type = number # Corrected
}
variable "desired_capacity" {
  type = number # Corrected
}
variable "lt_id" {
  type = string # Corrected
}
variable "tg_arn" {
  type = string # Corrected
}
variable "private_subnets" {
  type = list(string) # Corrected
}