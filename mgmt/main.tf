#
# because bucket names are global we claim the domains top
# level bucket here just to make sure we control it.
#
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

#
# SHARED RESOURCES
#

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allow inbound ssh traffic"

  ingress {
    description     = "allow internal access"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = ["sg-0017a211ce179040b"]
  }

  ingress {
    description = "allow access select locations"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["161.199.186.47/32"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_key_pair" "logic-refinery" {
  key_name = "logic-refinery"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDaowxostznFcMykfRP8ZO8wvm75wUk/ubpK6koneDUd9se+hXYQEQmiQVLqM+vZbAvkqKJpKL+ce3a9N8v3d3xhEn79Nax/yiXREHullvPIK8b7DTXGseKHEYcz3Dk5I2asG35XXSgd2Yr3dGFFtkA3pxV6kqPD+HU/BRcaZSC1SqARmxtw7J+loA4AO/XuLaVEo6074EMH7FcMk2J3tkGlcCSjg5XnyQaJBCvejfZQ23WFWVDlsZEEMP7TufosNbfHPgCVRJWA+I7/j7kXp/nNp/i/pXw/KtO4GX9XKXjLcTXhPLUO2tLUxMtTI4Ere0taMwkocKOUi0D77Kx+O3RvbtN36Gxtxcy3h0JguM2d/vOw5+m4LC/lfegG/oUTl1XAOt+kWgRei2KgzEiuU6MZDgZLeUebFVF+/tPMUa5ou3GuZpZoEn8+gBGmYDf+8a/QloEyCNWjqHUXc0x12mgalwXdWRSCXWAzcrWL9DsWnZw8LsSUG5oZAZsWx606b+MxFEiejxlP9hgFBlPHHNAYiNRiYw8O4olJwKTd0GhHZtpv0DOFPm3A82WJM6+aS1vfz3WGsnAL9GQAjRtCpJZP/uvURf8S5+CT52EA4nDK1hsaZTEX4CxdMIumN1IGfxispQpdzRu6PiwrWFHkUIUsv1D2NWdVCaFORDa+sLc9w== logic-refinery.20201004"
}
