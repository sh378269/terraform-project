resource "aws_s3_bucket" "tf-file" {
  bucket = "tf-state-dev"
  tags = {
    description = "tf state file adding"

  }
  }