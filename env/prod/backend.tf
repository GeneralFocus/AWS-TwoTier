terraform {
  backend "s3" {
    bucket       = "group3-prod-tfstate-bucket"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
