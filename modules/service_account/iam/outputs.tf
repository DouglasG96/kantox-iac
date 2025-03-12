output "app_user_access_key" {
  value = aws_iam_access_key.app_user_key.id
}

output "app_user_secret_key" {
  value     = aws_iam_access_key.app_user_key.secret
  sensitive = true
}