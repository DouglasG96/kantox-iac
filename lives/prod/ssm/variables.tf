variable "parameters" {
  description = "Map of parameters to create in Parameter Store"
  type = map(object({
    type  = string
    value = string
  }))
}

variable "tags" {
  description = "Tags to apply to the parameters"
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS profile to deploy resources"
  type        = string
  default     = "kantox"
}