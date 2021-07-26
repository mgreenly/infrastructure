##
## The project needs one top level bucket and table to store terraform state
##
#resource "aws_dynamodb_table" "bar_test" {
#  name         = "terraform.bar.logic-refinery.io"
#  billing_mode = "PAY_PER_REQUEST"
#  hash_key     = "LockID"
#  attribute {
#    name = "LockID"
#    type = "S"
#  }
#}

#resource "aws_s3_bucket" "bar_test" {
#  bucket = "terraform.bar.logic-refinery.io"
#  versioning {
#    enabled = false
#  }
#  server_side_encryption_configuration {
#    rule {
#      apply_server_side_encryption_by_default {
#        sse_algorithm = "AES256"
#      }
#    }
#  }
#}

##
## The project needs an admin group
##
#resource "aws_iam_group" "bar_admin" {
#  name = "BarAdmin"

#  depends_on = [
#    data.aws_iam_user.michaelgreenly
#  ]
#}

#resource "aws_iam_group_policy_attachment" "administrator_access_for_bar_admin" {
#  group      = aws_iam_group.bar_admin.name
#  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
#}


##
## import the relevant admin so we can attach the projects group
##

#data "aws_iam_user" "michaelgreenly" {
#  user_name = "michael.greenly"
#}

#resource "aws_iam_user_group_membership" "michaelgreenly" {
#  user = data.aws_iam_user.michaelgreenly.user_name

#  groups = [
#    aws_iam_group.bar_admin.name
#  ]
#}

##
##resource "aws_iam_user" "michaelgreenly" {
##  name = "michael.greenly"
##  path = "/bar/"
##}

### Admins are defined here.
###
### Admins have complete control of the resources in there project.
###
### Admins need to add an entry to there $HOME/.ssh/config like the following.
###
###    Host git-codecommit.*.amazonaws.com
###      User {{PUBLIC_KEY_ID}}
###      IdentityFile {{PATH_TO_CORRESONDING_PRIVATE_KEY}}
###
### The PUBLIC_KEY_ID can be obtained by running `terraform output`
##resource "aws_iam_user_ssh_key" "michaelgreenly" {
##  username   = aws_iam_user.michaelgreenly.name
##  encoding   = "SSH"
##  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1VK1pvSuOklw7/EIIOxQZ++dCMt2ZCtOkrDylasVe3lhleHCmpxqic/JGe7p5xKIJ6IM1SwgT00AbTlotKKWRegJUyGr7ArBU0Ht+3Arej22jn/eOIBJwg4AlhTWWzLQQB/1h4h3Okoh1aOXfr7wyJmbjIlmCLtp1KKYwUQT6HiyIDK3MouspgE5S+fAO+LspRPJvw5f4J7S8BCsV7YYEHg7mtd9WC5LBkyJHgEyWZOm6yg8RJLDkoMJJh2EJE1NT7XUsdC4KwkLvgDDyUB8QbiEhU4PXREzGdoINYeO9ssOLdmwsQy0aFSOztXbpsMaj3O09x5ySTqcsrAMy1t3xDBcsQ3/Kkj9XFh6i98kQ0uQnsHER/FdI4/seO4Xpd9rEh06elhSZMTNQrayaFxdB26z4JZjIkS1j090IX/fwezawxVhzKvedyIUTLqqkx3jE7cAl0tNueaR5Dxf9isLblMm6eVzodLJMSgcY/JxdZ+gU1RdwQGaY6RnxVHXEuAE= michael.greenly@bar.logic-refinery.io"
##}
##
##resource "aws_iam_user_group_membership" "michaelgreenly" {
##  user = aws_iam_user.michaelgreenly.name
##
##  groups = [
##    aws_iam_group.bar_admin.name
##  ]
##}
##
##output "admins" {
##  value = [
##    {
##      name: aws_iam_user.michaelgreenly.name,
##      path: aws_iam_user.michaelgreenly.path,
##      public_key_id = aws_iam_user_ssh_key.michaelgreenly.id
##    }
##  ]
##}
