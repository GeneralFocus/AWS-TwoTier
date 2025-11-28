terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

module "networking" {
  source = "../../modules/networking"

  env_name = "prod"
  vpc_cidr = "10.250.0.0/16"

  public_subnets = {
    "us-east-1a" = "10.250.1.0/24"
    "us-east-1b" = "10.250.2.0/24"
    "us-east-1c" = "10.250.3.0/24"
  }

  private_subnets = {
    "us-east-1a" = "10.250.4.0/24"
    "us-east-1b" = "10.250.5.0/24"
    "us-east-1c" = "10.250.6.0/24"
  }
}

module "security" {
  source = "../../modules/security"

  env_name = "prod"
  vpc_id   = module.networking.vpc_id
}


module "launch_template" {
  source        = "../../modules/launch-template"
  env_name      = "prod"
  bucket        = "group3-prod-bucket"
  ami           = var.ami
  instance_type = "t3.medium"
  web_sg        = module.security.web_sg
  key_name      = "vockey"
}
module "alb" {
  source         = "../../modules/alb"
  env_name       = "prod"
  public_subnets = module.networking.public_subnets
  alb_sg         = module.security.alb_sg
  vpc_id         = module.networking.vpc_id
}
module "asg" {
  source           = "../../modules/asg"
  env_name         = "prod"
  min_size         = 1
  max_size         = 4
  desired_capacity = 3
  lt_id            = module.launch_template.lt_id
  tg_arn           = module.alb.tg_arn
  private_subnets  = module.networking.private_subnets
}
