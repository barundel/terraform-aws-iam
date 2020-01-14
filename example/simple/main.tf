module "iam_example" {
  source = "../../"
  role_name = "IAMRole"

  create_role = true

  assume_role_policy = "${data.aws_iam_policy_document.trust_profile.json}"

  inline_policies_to_create = {
    "AllowIAM" = "${data.aws_iam_policy_document.iam_permissions.json}"
  }

  inline_policy_count = 1
}

