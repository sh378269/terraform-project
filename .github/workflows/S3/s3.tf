resource "aws_s3_bucket" "tf-file" {
  bucket = "shimpi-dev"
  acl= "private"
  tags = {
    description = "tf state file adding"

  }
  }
resource "aws_s3_bucket_object" "shared"{
    bucket = aws_s3_bucket.tf-file.id
    key = "terraform.statetf"
    source = "TERRAFORM_CLI_PATH/terraform.statetf"
}

