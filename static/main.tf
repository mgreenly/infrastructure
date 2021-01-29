provider "aws" {
  region = "us-east-2"
  profile = "logic-refinery"
}

resource "aws_s3_bucket" "terraform" {
  bucket = "terraform.logic-refinery.io"
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

resource "aws_dynamodb_table" "terraform" {
  name         = "terraform.logic-refinery.io"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
