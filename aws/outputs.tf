output "iam_role_arn" {
  value = aws_iam_role.iam_role[0].arn
}

output "iam_role_name" {
  value = aws_iam_role.iam_role[0].name
}

output "iam_policies_arn" {
  value = concat(
  aws_iam_policy.iam_policy.*.arn,
  aws_iam_policy.global_iam_policy.*.arn,
  )
}

output "iam_policies_names" {
  value = concat(
  aws_iam_policy.iam_policy.*.name,
  aws_iam_policy.global_iam_policy.*.name,
  )
}

output "iam_instance_profile" {
  value = aws_iam_instance_profile.iam_instance_profile[0].name
}

output "iam_instance_profile_arn" {
  value = aws_iam_instance_profile.iam_instance_profile[0].arn
}

output "group_name" {
  value = aws_iam_group.this[0].name
}

output "group_id" {
  value = aws_iam_group.this[0].id
}
