user_name          = "kantox-app-user-prod"
principal_service  = "github-actions.amazonaws.com"
policy_name        = "kantox-github-actions-policy"
policy_description = "Policy for GitHub Actions to access AWS resources"

tags = {
  Environment = "prod"
  Project     = "cloud-challenge"
  Owner       = "devops-team"
}

aws_region  = "us-east-1"
aws_profile = "kantox"