terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_ssm_parameter" "kantox_ssm_parameter" {
  for_each = var.parameters

  name  = each.key
  type  = each.value.type
  value = each.value.value

  tags = var.tags
}