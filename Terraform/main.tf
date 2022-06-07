resource "aws_ecr_repository" "marketplace_ecr" {
  name                 = "${var.project_name}-repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}