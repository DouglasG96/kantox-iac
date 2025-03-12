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
    key            = "prod/iam/kantox-terraform-state.tfstate"
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

module "kantox_iam" {
  source = "../../../modules/service_account/iam"

  user_name          = var.user_name
  principal_service  = var.principal_service
  policy_name        = var.policy_name
  policy_description = var.policy_description
  tags               = var.tags
}