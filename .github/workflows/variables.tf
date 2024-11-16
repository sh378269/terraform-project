variable "tfpath" {
  type        = string
  default     = "/home/runner/work/terraform-project/terraform-project/.github/workflows"
  description = "The path of our statefile"
}

variable "s3_bucket_name" {
  type    = list(string)
  default = ["shimpi-prod-bucket", "shimpi-stage-bucket", "shimpi-qa-bucket"]
}
