resource "aws_ecr_repository" "ecr-repo" {
  name                 = "terraform-project"
  image_tag_mutability = "MUTABLE"
 
  image_scanning_configuration {
    scan_on_push = true
  }
  encryption_configuration {
    encryption_type = "KMS"
  }
}
 
resource "aws_ecr_repository_policy" "ecr-repo-permission" {
  repository = aws_ecr_repository.ecr-repo.name
  policy     = data.terraform_remote_state.shared.outputs.ecrpermission-json
}
 
resource "aws_ecr_lifecycle_policy" "ecr-repo-lifeCyclepolicy" {
  repository = aws_ecr_repository.ecr-repo.name
 
  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Expire untagged images in 1 day.",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 1
      },
      "action": {
        "type": "expire"
      }
    },
    {
      "rulePriority": 2,
      "description": "Keep latest tagged images.",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 5
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

variable "market_name" {
  description = "respective market name resources belongs to"
}
 
variable "shared_state_bucket" {
  description = "Name of the shared state bucket"
  type        = string
}
