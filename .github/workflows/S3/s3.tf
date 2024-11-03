resource "aws_s3_bucket_object" "shared"{
    bucket  = "shimpi-dev"
    key     = "shared/terraform.statetf"
    source  = var.tfpath
}

