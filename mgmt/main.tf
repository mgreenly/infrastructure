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
    description = "allow access from bloomington"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["207.191.158.151/32", "208.118.151.85/32"]
  }

  tags = {
    Name = "allow_ssh"
  }
}


resource "aws_key_pair" "logic-refinery" {
  key_name = "logic-refinery"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDaowxostznFcMykfRP8ZO8wvm75wUk/ubpK6koneDUd9se+hXYQEQmiQVLqM+vZbAvkqKJpKL+ce3a9N8v3d3xhEn79Nax/yiXREHullvPIK8b7DTXGseKHEYcz3Dk5I2asG35XXSgd2Yr3dGFFtkA3pxV6kqPD+HU/BRcaZSC1SqARmxtw7J+loA4AO/XuLaVEo6074EMH7FcMk2J3tkGlcCSjg5XnyQaJBCvejfZQ23WFWVDlsZEEMP7TufosNbfHPgCVRJWA+I7/j7kXp/nNp/i/pXw/KtO4GX9XKXjLcTXhPLUO2tLUxMtTI4Ere0taMwkocKOUi0D77Kx+O3RvbtN36Gxtxcy3h0JguM2d/vOw5+m4LC/lfegG/oUTl1XAOt+kWgRei2KgzEiuU6MZDgZLeUebFVF+/tPMUa5ou3GuZpZoEn8+gBGmYDf+8a/QloEyCNWjqHUXc0x12mgalwXdWRSCXWAzcrWL9DsWnZw8LsSUG5oZAZsWx606b+MxFEiejxlP9hgFBlPHHNAYiNRiYw8O4olJwKTd0GhHZtpv0DOFPm3A82WJM6+aS1vfz3WGsnAL9GQAjRtCpJZP/uvURf8S5+CT52EA4nDK1hsaZTEX4CxdMIumN1IGfxispQpdzRu6PiwrWFHkUIUsv1D2NWdVCaFORDa+sLc9w== logic-refinery.20201004"
}

resource "aws_key_pair" "old-logic-refinery" {
  key_name = "old-logic-refinery"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9zRySdWq3HU6PyYiQXc02Affa/xTjpxTxv+X6jL3reUldnc8ey6nHSC77o00YBOxTPJBetLQiPITJnSwbE/tQGWwdV34Niznzgo1hXjSVfBlsru/sDlUGynoyWtF9QWCI1fhJ5grVFH3AP8rLmmZTc9pM1O2ZsB28O7rcO1EC/wupdt+2UZLuvGjwfFNvRstlIKvyG34zQOIDBqjF8MLak0P6QqryhB/CQM0z8L2mvYvBv9lBTPeiJUz/eszIBPaw2yX3ClwBsMafnOLF2wnmv1q20YSl586cDBjZPyyTQavWfHaF4R4NRo2Kfejog+mNWiYCSC2eF6m6U+QkdLdR6xjqA9lQ0jBZ74HCauF7QKGc456ajxYZmFt9JG4zBHTKgkryZ6+mNcqzbdryVsAZHKWVwos1myAG1rLRtGOkmjQrQe9auO7oWsmx5Kz9oQyg4ElDds9rgI0ZVwDe6/HhbjOZMP2g9WWRoLfVcRWD4IaMb22AG57HO5hsbbOvjPtQGHTcF5/XN2pf9sOvwAMmfoORv1GSXcq9CWzKy3f2nkhr1dY+6FTUPj+szS70RRz2fWufhO5BR71ppSswY0oFUrpxpzDt/3PIYXhgsbw1BtnIrTylmVpEbTMEzTC5wPS0fnCNbUpD1a6gO0W38trjwzpUA74drPwfSwqeC2NFxw== logic-refinery:20170924"
}
