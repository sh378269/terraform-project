resource "local_file" "shimpi"{
    filename = "${path.module}/shimpi.txt"
    content = "my test file"
}

resource "aws_iam_user" "admin-user"{
    name = "awstest"
    tags = {
        description = "aws test is tl in project"
    }
}