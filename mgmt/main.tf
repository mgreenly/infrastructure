#
# because s3 bucket names are global claim this domain just to make sure we control it
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
