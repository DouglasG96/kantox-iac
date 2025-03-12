output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.kantox_s3_bucket.bucket_name
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = module.kantox_s3_bucket.bucket_arn
}