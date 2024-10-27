resource "aws_s3_bucket" "tf-file" {
  bucket = "shimpi-dev"
  tags = {
    description = "tf state file adding"

  }
  }
resource "aws_s3_bucket_object" "shared"{
    bucket = aws_s3_bucket.tf-file.id
    content= "shared/terraform.statetf"
    key = "terraform.statetf"
}

