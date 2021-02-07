#
# The S3 bucket and the dynamodb table used in this file are manged by ../static and must already exist
#

data "aws_s3_bucket" "terraform" {
  bucket = "terraform.logic-refinery.io"
}

data "aws_dynamodb_table" "terraform" {
  name  = "terraform.logic-refinery.io"
}

terraform {
  backend "s3" {
    profile        = "logic-refinery"
    bucket         = "terraform.logic-refinery.io"
    key            = "state"
    region         = "us-east-2"
    dynamodb_table = "terraform.logic-refinery.io"
    encrypt        = true
  }
}

provider "aws" {
  region  = "us-east-2"
  profile = "logic-refinery"
}
