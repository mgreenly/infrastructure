#
#
# If we let the top level mgmt configs handle the bucket
# and dynamo table for the terraform state we are able
# to destroy this entire folder without loosing that state.
#

provider "aws" {
  region = "us-east-2"
  profile = "logic-refinery"
}

data "aws_s3_bucket" "terraform" {
  bucket = "terraform.logic-refinery.io"
}

data "aws_dynamodb_table" "terraform" {
  name  = "k3s.logic-refinery.io"
}

terraform {
  backend "s3" {
    profile = "logic-refinery"
    bucket         = "terraform.logic-refinery.io"
    key            = "state/k3s"
    region         = "us-east-2"
    dynamodb_table = "k3s.logic-refinery.io"
    encrypt        = true
  }
}
