resource "aws_s3_bucket" "tf-file" {
  bucket = "shimpi-dev"
  acl = "private"
  tags = {
    description = "tf state file adding"

  }
  }
resource "aws_s3_bucket_object" "shared"{
    bucket = aws_s3_bucket.tf-file.id
    key = "terraform.statetf"
    source = "/home/runner/work/terraform-project/terraform-project/.github/workflows/terraform.tfstate"
}

