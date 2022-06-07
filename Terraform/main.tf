resource "aws_ecr_repository" "marketplace_ecr" {
  name                 = "market-user-ms-repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}