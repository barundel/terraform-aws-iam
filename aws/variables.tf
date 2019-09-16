variable "role_name" {
  description = "Name of IAM Role to Create or IAM Policy name"
  default     = ""
}

variable "role_description" {
  description = "Description to associate with role"
  default     = ""
}

variable "create_role" {
  description = "Flag to allow disabling role disabled"
  default     = false
}

variable "assume_role_policy" {
  description = "Trust Relationship for the role Drives the creation of the role and attach entities"
  default     = ""
}

variable "policy_count" {
  description = "Number of policies to create. This is required due to 'count cannot be computed' when performing a count on a list with elements passed from output of another module."
  default     = 0
}

variable "policies_to_create" {
  description = "IAM Policy to create and attach to the role supports multiple"
  type        = map(string)
  default     = {}
}

variable "policies_to_attach" {
  description = "Additional Policy Arns that you can attach to your role policy"
  type        = list(string)
  default     = []
}

variable "global_policies" {
  description = "IAM Policies that are not specific to a particular Role"
  type        = list(string)

  default = []
}

variable "global_policy_names" {
  description = "Names of each Global Policy to create"
  type        = list(string)

  default = []
}

variable "global_policy_description" {
  description = "Description for policy"
  type        = list(string)

  default = []
}

variable "iam_instance_profile" {
  description = "IAM Instance profile or not"
  default     = false
}

variable "attach_policy_to_different_role" {
  description = "Flag to allow attaching created policies to a different role"
  default     = false
}

variable "inline_policies_to_create" {
  description = "Creates an inline policy to a the role"
  type        = map(string)

  default = {}
}

variable "role_to_attach_policies_to" {
  description = "A role name that you want to attach the policies you create to"
  default     = ""
}

variable "group_name" {
  description = "Name of Group to Attach a policy to"
  default     = ""
}

variable "attach_policy_to_group" {
  description = "Flag to allow attaching policies to an already existing IAM Group"
  default     = false
}

variable "create_group" {
  description = "Ability to create a group if you require"
  default     = false
}

variable "tags" {
  description = "Tags that need to be assigned to resources"
  type        = map(string)
  default     = {}
}

