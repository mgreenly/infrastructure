#
# The S3 bucket and the dynamodb table used in this file are
# manged in ../static and must already exist
#

data "aws_s3_bucket" "terraform" {
  bucket = "terraform.foo.logic-refinery.io"
}

data "aws_dynamodb_table" "terraform" {
  name  = "terraform.foo.logic-refinery.io"
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

#
# import each of the projects
#

module "foo" { source = "./projects/foo" }
module "bar" { source = "./projects/bar" }

#
# create global S3 buckets 
#

resource "aws_s3_bucket" "lr-none-p-ue2-s3bk-logicrefineryio" {
  bucket = "logic-refinery.io"
  acl = "private"
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


resource "aws_s3_bucket" "lr-none-p-ue2-s3bk-logicrefinerytv" {
  bucket = "logic-refinery.tv"
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

resource "aws_s3_bucket" "lr-none-p-ue2-s3bk-logicrefinerynet" {
  bucket = "logic-refinery.net"
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


resource "aws_s3_bucket" "lr-none-p-ue2-s3bk-wwwlogicrefinerycom" {
  bucket = "www.logic-refinery.com"
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

resource "aws_s3_bucket" "lr-none-p-ue2-s3bk-logicrefinery" {
  bucket = "logic-refinery"
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

#
# The users may belong to multiple projects so create them at
# the top level.
#

resource "aws_iam_user" "michael_greenly" {
  name = "michael.greenly"
}

# output "stuff" {
#   value = module.foo.admins
# }
