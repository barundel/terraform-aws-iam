variable "group_name" {description = "Name of the group you want to create"}
variable "policies_to_create" {type = map(string) description = "Policies you want to create for the group"}