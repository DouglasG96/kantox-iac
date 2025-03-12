#!/bin/bash

# Exit on error
set -e

# Define the base directory
BASE_DIR="lives/prod"

# Step 1: Deploy the terraform_state module
echo "Deploying terraform_state module..."
cd "${BASE_DIR}/terraform_state"
terraform fmt
terraform init
terraform plan
terraform apply -auto-approve
echo "terraform_state module deployed successfully."

# Step 2: Deploy the iam module
echo "Deploying iam module..."
cd "../iam"
terraform fmt
terraform init
terraform plan
terraform apply -auto-approve
echo "iam module deployed successfully."

# Step 3: Deploy the s3 module
echo "Deploying s3 module..."
cd "../s3"
terraform fmt
terraform init
terraform plan
terraform apply -auto-approve
echo "s3 module deployed successfully."

# Step 4: Deploy the ssm module
echo "Deploying ssm module..."
cd "../ssm"
terraform fmt
terraform init
terraform plan
terraform apply -auto-approve
echo "ssm module deployed successfully."

echo "All modules deployed successfully."