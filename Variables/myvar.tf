
variable "set_environment" {
  description = "Environment tags for the instance"
  type        = map(string)
  default = {
    project     = "project-alpha"  # Project name
    environment = "dev"            # Environment name (dev)
  }
}

variable "exampleUser" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["ab", "ac", "ad"]  # Dummy IAM user names
}
