#Step 1: Create a set
variable "my_set" {
  type    = set(string)
  default = ["value1", "value2", "value3"]
}

#Step 2: Conver it to the list
locals {
  my_list = tolist(var.my_set)
}

#Step 3: Use for loop
resource "my_resource" "example" {
  for_each = { for idx, value in local.my_list : idx => value }

  name = each.value
  # Additional resource configuration...
} 







variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
} 
bash
You can use the above-declared variable inside your terraform file in a very simple way -

output "print_the_names" {
  value = [for name in var.user_names : name]
}






variable "iam_users" {
  description = "map"
  type        = map(string)
  default     = {
    user1      = "normal user"
    user2  = "admin user"
    user3 = "root user"
  }
}
bash
Now let's iterate over the map

output "user_with_roles" {
  value = [for name, role in var.iam_users : "${name} is the ${role}"]
}



For list -
{for <ITEM> in <LIST> : <OUTPUT_KEY> => <OUTPUT_VALUE>}

For Map -
{for <KEY>, <VALUE> in <MAP> : <OUTPUT_KEY> => <OUTPUT_VALUE>} 

