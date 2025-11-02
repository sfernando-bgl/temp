resource "aws_iam_group" "groups" {
  for_each = toset(flatten([for user in local.users : user.groups]))
  name     = each.key
}

resource "aws_iam_user" "users" {
  for_each = local.users
  name     = each.value.username
}

resource "aws_iam_user_group_membership" "user_memberships" {
  for_each = local.users

  user   = aws_iam_user.users[each.key].name
  groups = each.value.groups
  depends_on = [aws_iam_group.groups]
}