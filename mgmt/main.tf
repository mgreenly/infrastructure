##
## because bucket names are global we claim the domains top
## level bucket here just to make sure we control it.
##
resource "aws_s3_bucket" "default" {
  bucket = "logic-refinery.io"
  versioning { 
    enabled = false 
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
