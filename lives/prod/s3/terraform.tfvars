bucket_name        = "kantox-s3-prod"
acl                = "private"
versioning_enabled = "true"
tags = {
  Environment = "prod"
  Project     = "cloud-challenge"
  Owner       = "devops-team"
}
aws_region  = "us-east-1"
aws_profile = "kantox"