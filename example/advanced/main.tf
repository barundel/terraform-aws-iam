module "developer_role" {
  source = "../../"

  // If to create the IAM role
  create_role = true

  // Name of the role you are creating
  role_name = "developer-role"

  // Trust policy, example is a role you can assume you must update the account number, to make a role a service can assume update the principle.
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::0000000000:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  // List of policies to attach, update as needed.
  policies_to_attach = ["arn:aws:iam::aws:policy/PowerUserAccess"]

}