variable "tfpath" {
  type        = string
  default     = "/home/runner/work/terraform-project/terraform-project/.github/workflows"
  description = "The path of our statefile"
}

variable "s3_bucket_name" {
  type    = "list"
  default = ["prod_bucket", "stage-bucket", "qa_bucket"]
}
