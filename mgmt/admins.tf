# Admin users are defined here
#
# Each user needs to add an entry to there $HOME/.ssh/config like the following
#
#    Host git-codecommit.*.amazonaws.com
#      User {{PUBLIC_KEY_ID}}
#      IdentityFile {{PATH_TO_CORRESONDING_PRIVATE_KEY}}
#

#
# Michael Greenly
#
resource "aws_iam_user" "michael_greenly" {
  name = "michael.greenly"
}

resource "aws_iam_user_ssh_key" "michael_greenly" {
  username   = aws_iam_user.michael_greenly.name
  encoding   = "SSH"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1VK1pvSuOklw7/EIIOxQZ++dCMt2ZCtOkrDylasVe3lhleHCmpxqic/JGe7p5xKIJ6IM1SwgT00AbTlotKKWRegJUyGr7ArBU0Ht+3Arej22jn/eOIBJwg4AlhTWWzLQQB/1h4h3Okoh1aOXfr7wyJmbjIlmCLtp1KKYwUQT6HiyIDK3MouspgE5S+fAO+LspRPJvw5f4J7S8BCsV7YYEHg7mtd9WC5LBkyJHgEyWZOm6yg8RJLDkoMJJh2EJE1NT7XUsdC4KwkLvgDDyUB8QbiEhU4PXREzGdoINYeO9ssOLdmwsQy0aFSOztXbpsMaj3O09x5ySTqcsrAMy1t3xDBcsQ3/Kkj9XFh6i98kQ0uQnsHER/FdI4/seO4Xpd9rEh06elhSZMTNQrayaFxdB26z4JZjIkS1j090IX/fwezawxVhzKvedyIUTLqqkx3jE7cAl0tNueaR5Dxf9isLblMm6eVzodLJMSgcY/JxdZ+gU1RdwQGaY6RnxVHXEuAE= michael.greenly@space.logic-refinery.io"
}

resource "aws_iam_user_group_membership" "michael_greenly" {
  user = aws_iam_user.michael_greenly.name

  groups = [
    aws_iam_group.space_admin.name
  ]
}
