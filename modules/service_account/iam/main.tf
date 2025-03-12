terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_iam_user" "app_user" {
  name = var.user_name
  tags = var.tags
}

resource "aws_iam_policy" "app_policy" {
  name        = var.policy_name
  description = var.policy_description
  policy      = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "s3:ListBucket",
          "s3:GetObject"
        ],
        "Resource": [
          "arn:aws:s3:::kantox-s3-prod",
          "arn:aws:s3:::kantox-s3-prod/*"
        ]
      },
      {
        "Effect": "Allow",
        "Action": [
          "ssm:GetParameter",
          "ssm:GetParameters"
        ],
        "Resource": "arn:aws:ssm:us-east-1:783764593099:parameter/*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "app_policy_attachment" {
  user       = aws_iam_user.app_user.name
  policy_arn = aws_iam_policy.app_policy.arn
}

resource "aws_iam_access_key" "app_user_key" {
  user = aws_iam_user.app_user.name
}