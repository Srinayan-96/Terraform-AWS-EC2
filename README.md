# Terraform AWS EC2 Deployment

A simple Infrastructure as Code (IaC) project that uses **Terraform** and the **AWS Provider** to provision EC2 instances on Amazon Web Services.

## Project Overview

This project demonstrates how to:

- Configure the AWS provider with Terraform
- Use Terraform variables for region, instance type, and instance count
- Create multiple EC2 instances using `count`
- Assign unique names using `count.index`
- Export EC2 instance IDs and public IP addresses
- Manage AWS infrastructure using Terraform CLI

## Architecture

```text
Developer Machine
       |
       | AWS CLI credentials
       v
    Terraform
       |
       | AWS Provider
       v
   AWS Account
       |
       v
   EC2 Instances
   ├── Terraform-EC2-1
   └── Terraform-EC2-2
```

## Project Structure

```text
terraform-aws-ec2/
├── main.tf
├── variables.tf
├── outputs.tf
├── AWS_TERRAFORM_COMMANDS.txt
├── README.md
└── .gitignore
```

> `.terraform/`, `terraform.tfstate`, and `terraform.tfstate.backup` should not be committed to GitHub. They are generated/local Terraform files and may contain sensitive infrastructure information.

## Technologies Used

- Terraform
- Amazon Web Services (AWS)
- AWS EC2
- AWS CLI
- HCL
- Infrastructure as Code (IaC)

## Prerequisites

Install/configure:

1. An AWS account
2. An IAM user or IAM identity with permission to create the required EC2 resources
3. AWS CLI
4. Terraform
5. Git

Verify installations:

```bash
aws --version
terraform --version
git --version
```

## AWS IAM Configuration

For local development, create an IAM identity intended for CLI/API access and create an access key only when required by your chosen authentication method.

### Recommended security practices

- Do not use the AWS root account for everyday CLI work.
- Give the IAM identity only the permissions required for the project.
- Never put an AWS access key or secret access key inside `.tf` files.
- Never commit AWS credentials to GitHub.
- Never put credentials in `README.md`, screenshots, or source code.
- Rotate/revoke credentials if they are accidentally exposed.

For a learning project, permissions must cover the EC2 operations Terraform needs. In a real project, use least-privilege permissions rather than broad administrator permissions.

## Configure AWS CLI

After installing AWS CLI, configure it:

```bash
aws configure
```

Enter:

```text
AWS Access Key ID:     <your-access-key-id>
AWS Secret Access Key: <your-secret-access-key>
Default region name:   ap-south-1
Default output format: json
```

Verify the credentials:

```bash
aws sts get-caller-identity
```

If this command returns your AWS account/identity information, the CLI is authenticated.

## Terraform Configuration

### `variables.tf`

The project defines:

- `region` — AWS region, default `ap-south-1`
- `instance_type` — EC2 instance type, default `t3.micro`
- `instance_count` — number of EC2 instances, default `2`

### `main.tf`

The main configuration:

- Declares the AWS provider
- Uses the configured AWS region
- Creates EC2 instances
- Uses `count` to create multiple instances
- Uses `count.index` to generate instance names

The default names are:

```text
Terraform-EC2-1
Terraform-EC2-2
```

### `outputs.tf`

Terraform displays:

- EC2 instance IDs
- EC2 public IP addresses

## Run the Project

Open a terminal in the project directory.

### 1. Initialize Terraform

```bash
terraform init
```

This downloads the required AWS provider and initializes the working directory.

### 2. Validate the configuration

```bash
terraform validate
```

Expected result:

```text
Success! The configuration is valid.
```

### 3. Format the Terraform files

```bash
terraform fmt
```

### 4. Review the execution plan

```bash
terraform plan
```

Always review the plan before creating infrastructure.

### 5. Create the EC2 instances

```bash
terraform apply
```

Terraform will ask for confirmation.

Enter:

```text
yes
```

### 6. View Terraform outputs

```bash
terraform output
```

For individual outputs:

```bash
terraform output instance_ids
terraform output public_ips
```

### 7. Check the instances from AWS CLI

```bash
aws ec2 describe-instances
```

You can also check the EC2 instances from the AWS Console.

## Destroy the Infrastructure

When you finish the practical, destroy the resources to avoid unnecessary AWS charges:

```bash
terraform destroy
```

Confirm with:

```text
yes
```

## Important: AMI Region

The AMI ID in `main.tf` is:

```text
ami-0f58b397bc5c1f2e8
```

AMI IDs are region-specific. The configuration uses:

```text
ap-south-1
```

If you change the AWS region, verify that the AMI exists and is compatible in that region before running `terraform apply`.

## GitHub Safety

Before pushing this project:

```bash
git status
```

Make sure you are NOT committing:

```text
.terraform/
terraform.tfstate
terraform.tfstate.backup
*.tfvars
.env
AWS credentials
private keys
```

The included `.gitignore` helps prevent common Terraform and credential files from being committed.

## Git Commands

Initialize the repository:

```bash
git init
```

Add files:

```bash
git add .
```

Commit:

```bash
git commit -m "Add Terraform AWS EC2 deployment"
```

Connect your GitHub repository:

```bash
git remote add origin https://github.com/<YOUR-USERNAME>/<YOUR-REPOSITORY>.git
```

Rename the branch:

```bash
git branch -M main
```

Push:

```bash
git push -u origin main
```

## What This Project Demonstrates

This project demonstrates practical understanding of:

- Infrastructure as Code
- Terraform provider configuration
- Terraform variables
- Terraform resources
- Resource `count`
- `count.index`
- Terraform outputs
- AWS EC2 provisioning
- AWS CLI authentication
- Basic cloud infrastructure automation
- Git/GitHub project management

## Cleanup

After testing:

```bash
terraform destroy
```

Then verify in the AWS Console that the created EC2 resources have been removed.

---

**Author:** Sri Nayan  
**Project:** Terraform AWS EC2 Deployment  
**Purpose:** Infrastructure as Code / Cloud & DevOps Practice
