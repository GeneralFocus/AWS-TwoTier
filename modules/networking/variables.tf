variable "env_name" {
  type = string # Added 'type' attribute
}
variable "vpc_cidr" {
  type = string # Added 'type' attribute
}

variable "public_subnets" {
  type = map(string)
}

variable "private_subnets" {
  type = map(string)
}