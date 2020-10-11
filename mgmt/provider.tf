provider "aws" {
  region = "us-east-2"
  profile = "logic-refinery"
}

#
# we keep the state for these in ../static
#

data "aws_s3_bucket" "terraform" {
  bucket = "terraform.logic-refinery.io"
}

data "aws_dynamodb_table" "terraform" {
  name  = "mgmt.logic-refinery.io"
}

terraform {
  backend "s3" {
    profile = "logic-refinery"
    bucket         = "terraform.logic-refinery.io"
    key            = "state/mgmt"
    region         = "us-east-2"
    dynamodb_table = "mgmt.logic-refinery.io"
    encrypt        = true
  }
}
