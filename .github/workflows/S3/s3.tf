resource "aws_s3_bucket" "tf-file" {
  bucket = "shimpi-dev"
  tags = {
    description = "tf state file adding"

  }
  }