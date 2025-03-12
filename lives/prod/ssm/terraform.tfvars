parameters = {
  "username" = {
    type  = "String"
    value = "admin"
  }
  "password" = {
    type  = "SecureString"
    value = "supersecret"
  }
}

tags = {
  Environment = "prod"
  Project     = "cloud-challenge"
  Owner       = "devops-team"
}

aws_region  = "us-east-1"
aws_profile = "kantox"