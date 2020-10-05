resource "aws_s3_bucket" "s3" {
  bucket = var.s3_bucket_name
  versioning  {
    enabled = var.enable_versioning
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.server_side_encryption_type
      }
    }
  }
  tags   = var.s3_tags
  policy = file("policy.json")
}
