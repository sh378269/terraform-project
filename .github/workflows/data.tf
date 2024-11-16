terraform {
  backend "s3" {
    bucket = "shimpi-dev"
    key = "shared/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
    
  }
}