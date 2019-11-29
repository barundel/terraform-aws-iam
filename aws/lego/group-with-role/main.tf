module "group" {
  source = "../../"

  create_group = true

  group_name = var.group_name

}

module "permissions" {
  source = "../../"

  policies_to_create = var.policies_to_create

}

resource "aws_iam_group_policy_attachment" "attach" {
  group = module.group.group_name
  policy_arn = module.permissions.iam_policies_arn[0]
}

