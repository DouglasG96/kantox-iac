terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "kantox-terraform-state"
    key            = "prod/ssm/kantox-terraform-state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "kantox-lock-table"
    encrypt        = true
    profile        = "kantox"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "kantox_ssm" {
  source     = "../../../modules/secrets/ssm"
  parameters = var.parameters
  tags       = var.tags
}