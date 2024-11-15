data "terraform_remote_state" "shared" {
  backend = "s3"
  config = {
    bucket  = "shimpi-dev"
    key     = "shared/terraform-shared.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}