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