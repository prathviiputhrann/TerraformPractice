
#Step 1: Create a map 
variable "my_map" {
  type = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}

#Step 2: Iterate over the map using for_each
resource "my_resource" "example" {
  for_each = var.my_map

  name  = each.key
  value = each.value
  # Additional resource configuration...
}





resource "aws_iam_user" "example" {
  for_each = var.user_names
  name  = each.value
}

variable "user_names" {
  description = "IAM usernames"
  type        = set(string)
  default     = ["user1", "user2", "user3s"]
} 




#Step 1: Create a list varible
variable "my_list" {
   type    = list(string)
   default = ["value1", "value2", "value3"]
}

resource "my_resource" "example" {
   
   #Step 2: Convert list to set using toset() function 
   for_each = toset(var.my_list)

   #Step 3: Iterate over the list
   name = each.value
   # Additional resource configuration...
}