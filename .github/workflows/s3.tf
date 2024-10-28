
resource "aws_s3_bucket_object" "shared"{
    bucket = aws_s3_bucket.tf-file.id
    key = "shimpi-dev"
    source = "/home/runner/work/terraform-project/terraform-project/.github/workflows/terraform.tfstate"
    content = "shimpi-dev/shared/"
}

