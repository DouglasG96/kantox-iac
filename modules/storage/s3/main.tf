terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_s3_bucket" "kantox_bucket" {
  bucket = var.bucket_name
  acl    = var.acl

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "kantox_bucket_versioning" {
  bucket = aws_s3_bucket.kantox_bucket.id
  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Disabled"
  }
}