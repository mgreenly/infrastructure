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

resource "aws_dynamodb_table" "k3s" {
  name         = "k3s.logic-refinery.io"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
