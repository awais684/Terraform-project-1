## 1. Create a Provider.tf file
In this file i specify the region and AWS user credentials using one of the following secure ways

- aws configure
- Environment variables
- IAM roles (recommended for EC2, CloudShell, CI/CD)

## 2. Create Main.tf file
In this file i created an S3 bucket for the remote backend to store terraform state file and make it private with versioning enabled

## 3. Create backend.tf file
In this file i created a remote backend S3 to store terraform state file and make it private with versioning enabled

## 4. Create an AWS Secret Manager

```
aws secretsmanager create-secret --name my-database-password-johndoe --secret-string "YourSecurePassword"
```

## Update Main.tf file
updated my main.tf and create RDS resource



