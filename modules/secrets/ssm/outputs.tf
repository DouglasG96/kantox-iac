output "parameter_arns" {
  value = {
    for k, v in aws_ssm_parameter.kantox_ssm_parameter : k => v.arn
  }
}