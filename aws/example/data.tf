data "aws_iam_account_alias" "current" {}
data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "cross_account_role_profile" {
  statement {
    sid = "AuthAssumeRole"

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${var.assume_role_account_number}:root",
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

data "aws_iam_policy_document" "iam_boundary" {

  statement {
    sid =       "IAMList"
    actions =   [
      "iam:ListServerCertificates",
      "iam:ListPoliciesGrantingServiceAccess",
      "iam:ListServiceSpecificCredentials",
      "iam:ListMFADevices",
      "iam:ListSigningCertificates",
      "iam:ListVirtualMFADevices",
      "iam:ListInstanceProfilesForRole",
      "iam:ListSSHPublicKeys",
      "iam:ListAttachedRolePolicies",
      "iam:ListAttachedUserPolicies",
      "iam:ListAttachedGroupPolicies",
      "iam:ListRolePolicies",
      "iam:ListAccessKeys",
      "iam:ListPolicies",
      "iam:ListSAMLProviders",
      "iam:ListGroupPolicies",
      "iam:ListEntitiesForPolicy",
      "iam:ListRoles",
      "iam:ListUserPolicies",
      "iam:ListInstanceProfiles",
      "iam:ListPolicyVersions",
      "iam:ListOpenIDConnectProviders",
      "iam:ListGroupsForUser",
      "iam:ListAccountAliases",
      "iam:ListUsers",
      "iam:ListGroups",
      "iam:GetLoginProfile",
      "iam:GetAccountSummary",
      "sts:GetCallerIdentity"
    ]
    effect =    "Allow"
    resources = [
      "*"]
  }

  statement {
    sid =       "IAMRead"
    actions =   [
      "iam:GetPolicyVersion",
      "iam:GetServiceLastAccessedDetailsWithEntities",
      "iam:GenerateServiceLastAccessedDetails",
      "iam:GetServiceLastAccessedDetails",
      "iam:GetContextKeysForPrincipalPolicy",
      "iam:GetServiceLinkedRoleDeletionStatus",
      "iam:SimulateCustomPolicy",
      "iam:SimulatePrincipalPolicy",
      "iam:GetServerCertificate",
      "iam:GetRole",
      "iam:GetInstanceProfile",
      "iam:GetPolicy",
      "iam:GetContextKeysForCustomPolicy",
      "iam:GetRolePolicy"
    ]
    effect =    "Allow"
    resources = [
      "*"]
  }

}

