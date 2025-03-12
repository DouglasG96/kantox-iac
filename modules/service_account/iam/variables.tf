variable "user_name" {
  description = "Name of the IAM user"
  type        = string
}

variable "principal_service" {
  description = "Service principal for the user"
  type        = string
  default     = "ec2.amazonaws.com"
}

variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
}

variable "policy_description" {
  description = "Description of the IAM policy"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the IAM user"
  type        = map(string)
  default     = {}
}