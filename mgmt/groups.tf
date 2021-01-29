#
# Each project gets a {project}_admin group.  That group has all the necessary
# policies to adminster the group
#

resource "aws_iam_group" "space_admin" {
  name = "SpaceAdmin"
}

resource "aws_iam_group_policy_attachment" "administrator_access_for_space_admin" {
  group      = aws_iam_group.space_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
