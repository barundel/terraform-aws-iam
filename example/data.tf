data "aws_iam_account_alias" "current" {}
data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "trust_profile" {
  statement {
    sid = "TrustProfile"

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::ACCOUNTNUMBER:root",
      ]
    }

    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]
  }
}

// The boundary sets what IAM actions can be used, this just enables the permission.
data "aws_iam_policy_document" "iam_permissions" {
  statement {
    sid = "IAMWildCard"
    effect = "Allow"
    actions = ["iam:*"]
    resources = ["*"]
  }
}