
resource "aws_s3_bucket_object" "shared"{
    bucket = "shimpi-dev"
    key = "terraform.statetf"
    source = "/home/runner/work/terraform-project/terraform-project/.github/workflows/terraform.tfstate"
    content = "shimpi-dev/shared/"
}

