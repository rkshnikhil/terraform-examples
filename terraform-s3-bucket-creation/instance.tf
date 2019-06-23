
resource "aws_s3_bucket" "kops-bucket" {
  bucket = "kops-state-bucket-010"
  acl = "private"
  tags   = "${var.tags}"

  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}