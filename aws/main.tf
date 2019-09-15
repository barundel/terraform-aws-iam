# Creates an IAM Role
resource "aws_iam_role" "iam_role" {
  count = var.create_role ? 1 : 0

  name               = var.role_name
  description        = var.role_description
  assume_role_policy = var.assume_role_policy

}

# Attaches the policy as an inline policy to the role
resource "aws_iam_role_policy" "inline_policy" {
  count = length(var.inline_policies_to_create)
  name  = keys(var.inline_policies_to_create)[count.index]

  policy = values(var.inline_policies_to_create)[count.index]
  role   = aws_iam_role.iam_role[0].id
}

# Creates an IAM Instance profile if required defaults to False
resource "aws_iam_instance_profile" "iam_instance_profile" {
  count = var.iam_instance_profile ? 1 : 0

  name = var.role_name
  role = aws_iam_role.iam_role[count.index].name
}

# Attaches both IAM Policy and any additional policies to the created role
resource "aws_iam_role_policy_attachment" "iam_role" {
  count = var.create_role && var.policy_count > 0 || length(var.policies_to_attach) > 0 ? var.policy_count + length(var.policies_to_attach) : 0

  role       = aws_iam_role.iam_role[0].name
  policy_arn = concat(aws_iam_policy.iam_policy.*.arn, var.policies_to_attach)[count.index]
}

# IAM Policies to create
resource "aws_iam_policy" "iam_policy" {
  count = length(var.policies_to_create)

  name   = keys(var.policies_to_create)[count.index]
  policy = values(var.policies_to_create)[count.index]
}

# Creates a Global IAM Policy without associating to a role
resource "aws_iam_policy" "global_iam_policy" {
  count = length(var.global_policies)

  name        = var.global_policy_names[count.index]
  description = var.global_policy_description[count.index]

  policy = var.global_policies[count.index]
}

# Attaches the Policies you create to the role specified
resource "aws_iam_role_policy_attachment" "test-attach" {
  count = var.attach_policy_to_different_role ? var.policy_count : 0

  role       = var.role_to_attach_policies_to
  policy_arn = aws_iam_policy.iam_policy[count.index].arn
}

resource "aws_iam_group_policy_attachment" "attach_policy_to_group" {
  count = var.attach_policy_to_group ? var.policy_count : 0

  group      = concat(aws_iam_group.this.*.name, [var.group_name])[0]
  policy_arn = aws_iam_policy.iam_policy[count.index].arn
}

resource "aws_iam_group" "this" {
  count = var.create_group ? 1 : 0
  name = var.group_name
}

# Creates some local variables to keep lines shorter in interpolations.
locals {
  role_policy_count = var.policy_count + length(var.policies_to_attach)
}

