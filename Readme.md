# 🚀 Terraform AWS Infrastructure Deployment

This project automates the deployment of a scalable and secure AWS infrastructure using Terraform. It provisions a S3, SSM secrets, IAM user. 
---

## 📋 Prerequisites

Before you begin, ensure you have the following installed and configured:

### 1. **Terraform** 🛠️  
Install Terraform from the [official website](https://www.terraform.io/downloads.html).

### 2. **AWS CLI** 🔑  
Install the AWS CLI from the [official guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).

### 3. **IAM Credentials** 🔒  
Create an IAM user with programmatic access and the following permissions:
   - `IAMFullAccess`
   - `AmazonS3FullAccess`
   - `AmazonSSMFullAccess`

Save the **Access Key ID** and **Secret Access Key** for the next steps.

---

## 🛠️ Setup Instructions

### 1. Configure AWS CLI
Run the following command to set up your AWS CLI with IAM credentials:

```bash
aws configure --profile kantox
```

- **AWS Access Key ID**: Paste your Access Key ID.
- **AWS Secret Access Key**: Paste your Secret Access Key.
- **Default region name**: Enter `us-east-1` (or your preferred region).
- **Default output format**: Leave blank or enter `json`.

### 2. Update `.tfvars` File
Modify the `terraform.tfvars` file with your specific values:

```hcl
profile = "kantox-iac"  # Your AWS CLI profile name
region  = "us-east-1"    # AWS region to deploy resources
```


### 3. Deploy the Infrastructure
Execute the following script to create the AWS resources:

```bash
./deploy.sh
```

Note: If you have any issues you should set permissions for execution to the script with the following command:

```bash
chmod +x ./deploy.sh
```

---

## 🛑 Destroying the Infrastructure

To avoid unnecessary charges, destroy the infrastructure when you're done:

```bash
./destroy.sh
```

Note: If you have any issues you should set permissions for execution to the script with the following command:

```bash
chmod +x ./destroy.sh
```

---

## 📂 Project Structure

```bash
.
├── lives/
│   ├── prod/
│   ├── iam/
│   │   ├── main.tf #Where the module is called
│   │   ├── variables.tf #Variables of the module
│   │   └── outputs.tf #Values after deployed infrastructure
│   │   └── terraform.tfvars #Specific and needed values for infrastructure
│   ├── s3/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │   └── terraform.tfvars
│   ├── ssm/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │   └── terraform.tfvars
│   ├── terraform_state/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │   └── terraform.tfvars
├── modules/
│   ├── secrets/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── service_account/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── storage/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
├── deploy.sh              # Script for automating infrastructure creation
├── destroy.sh             # Script for automating infrastructure destruction
├── README.md              # Project documentation
└── .gitignore             # Files to ignore in Git
```
---

### Notes:
- **This project uses the remote state approach**: It creates a S3 bucket to save the terraform state file (tfstate) and you must define the sctructure of your folders within S3 bucket.

### Workflow Overview:
- **Terraform Lint & Validate**: Ensures Terraform code is correctly formatted.
- **Terraform Plan**: Generates an execution plan for review.
- **Terraform Apply**: Deploys changes if approved.
- **Terraform Destroy**: Destroys infrastructure if approved.

## 🙏 Acknowledgments

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

Happy deploying! 🎉