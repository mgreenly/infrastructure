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
  name         = "prod.terraform.space.logic-refinery.io"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_dynamodb_table" "space_test" {
  name         = "test.terraform.space.logic-refinery.io"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
