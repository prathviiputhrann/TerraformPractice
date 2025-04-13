provider "aws" {
  region     = "eu-central-1"
  access_key = "XXXXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXX"
}

# Create IAM users from list
resource "aws_iam_user" "example_list" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

# Local value to convert set to list
locals {
  example_list_from_set = tolist(var.users)
}

# Create IAM users from set (converted to list)
resource "aws_iam_user" "example_set" {
  count = length(local.example_list_from_set)
  name  = local.example_list_from_set[count.index]
}

# Another locals block for map keys (must not redefine locals)
locals {
  my_keys = keys(var.my_map)
}

# Example resource to use map data — dummy resource for demo
resource "null_resource" "my_map_res" {
  count = length(local.my_keys)

  triggers = {
    key   = local.my_keys[count.index]
    value = var.my_map[local.my_keys[count.index]]
  }
}

# Variable definitions
variable "user_names" {
  description = "IAM usernames from list"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}

variable "users" {
  description = "IAM usernames from set"
  type        = set(string)
  default     = ["user4", "user5", "user6"]
}

variable "my_map" {
  description = "Map input"
  type        = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}
