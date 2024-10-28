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
    source = var.tf_path
}

variable "tf_path" {
  description = "path of state bucket"
  type        = string
  default = $PWD
}

