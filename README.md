# terraform-iam [![Build Status](https://github.com/barundel/terraform-aws-iam/workflows/build/badge.svg)](https://github.com/barundel/terraform-aws-iam/actions)

> **A Terraform module for creating IAM resources.**

## Table of Contents

- [Maintenance](#maintenance)
- [Getting Started](#getting-started)
- [License](#license)

## Maintenance

This project is maintained [Martin Etmajer](https://github.com/barundel), anyone is welcome to contribute. 

## Getting Started

#### Assumable Role Example

```
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
```

## License

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.