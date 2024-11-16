resource "aws_ecr_repository" "ecr-repo" {
  name                 = "terraform-project2"
  image_tag_mutability = "IMMUTABLE"
 
  image_scanning_configuration {
    scan_on_push = false
  }
  encryption_configuration {
    encryption_type = "KMS"
  }
}
 
#resource "aws_ecr_repository_policy" "ecr-repo-permission" {
#  repository = aws_ecr_repository.ecr-repo.name
#  policy     = data.terraform_remote_state.shared.outputs.ecrpermission-json
#}
 
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


resource "aws_s3_bucket" "files" {
   count         = "${length(var.s3_bucket_name)}"
   bucket        = "${var.s3_bucket_name[count.index]}"
   acl           = "private"
   tags = {
     description = "used for env ${var.s3_bucket_name[count.index]}"

    }
}
resource "aws_s3_bucket_object" "shared"{
    count         = "${length(var.s3_bucket_name)}"
    bucket  = "${var.s3_bucket_name[count.index]}.id"
    acl     = "private"
    key     = "shared/"
   #content type is kind of type of data you are uploading like image, file etc 
    content_type  = "application/x-directory"  
}

# uploading multiple files from some path
# resource "aws_s3_bucket_object" "upload_tffile"{
#     bucket  = aws_s3_bucket.tf-file.id
#     for_each =  fileset("${var.tfpath}/","*")
#     key     = "shared/${each.value}"
#     source  = each.value
# }

