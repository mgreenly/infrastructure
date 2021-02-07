#
# All environments re-use the same S3 bucket for terraform state
# but for now we still need separate dynamodb tables for each
# envrionment.
#
#     resource "aws_dynamodb_table" "{{subdomain}}" {
#       name         = "{{fqdn}}"
#       billing_mode = "PAY_PER_REQUEST"
#       hash_key     = "LockID"
#       attribute {
#         name = "LockID"
#         type = "S"
#       }
#     }
#
#

resource "aws_dynamodb_table" "space_prod" {
  name         = "terraform.prod.space.logic-refinery.io"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "space_prod" {
  bucket = "space.logic-refinery.io"
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

resource "aws_dynamodb_table" "space_test" {
  name         = "terraform.test.space.logic-refinery.io"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "space_test" {
  bucket = "test.space.logic-refinery.io"
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
