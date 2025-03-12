output "app_user_access_key" {
  value = module.kantox_iam.app_user_access_key
}

output "app_user_secret_key" {
  value     = module.kantox_iam.app_user_secret_key
  sensitive = true
}