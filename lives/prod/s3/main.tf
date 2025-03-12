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
    key            = "prod/s3/kantox-terraform-state.tfstate"
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

module "kantox_s3_bucket" {
  source             = "../../../modules/storage/s3"
  bucket_name        = var.bucket_name
  acl                = var.acl
  versioning_enabled = var.versioning_enabled
  tags               = var.tags
}