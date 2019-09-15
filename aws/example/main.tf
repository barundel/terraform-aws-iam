module "iam_example" {
  source = "../"
  role_name                 = "AMRole"

  create_role = true

  assume_role_policy        = "${data.aws_iam_policy_document.cross_account_role_profile.json}"
  iam_path                  = "/cdl/"

  inline_policies_to_create = {
    "AllowIAM" = "${data.aws_iam_policy_document.iam_permissions.json}"
  }

  inline_policy_count = 1

}